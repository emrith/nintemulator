module fc.ppu.sp.sp_output_unit;


import fc.ppu.sp.oam;


class SpOutputUnit
{
    private Oam oam;

    public int active;

    this(Oam oam)
    {
        this.oam = oam;
    }

    bool priority()
    {
        return (oam.Output[active].attribute & 0x20) == 0;
    }

    int getOutputColor()
    {
        int output = 0;

        // Loop backwards, so the highest priority sprites will override
        // the lower priority ones.
        // 

        foreach_reverse(i, ref obj; oam.Output)
        {
            // Objects become "active" when their counters go "negative"
            // And they remain "active" for 8 clocks. I'm not sure how
            // this is really implemented, but (x & $1f8) == $1f8 does
            // match that pattern and is the simplest explanation.
            // 
            // Decimal: -1,   -2,   -3,   -4,   -5,   -6,   -7,   -8
            // 9-bit: $1ff, $1fe, $1fd, $1fc, $1fb, $1fa, $1f9, $1f8
            // 

            if ((--obj.x & 0x1f8) == 0x1f8)
            {
                int bit0 = (obj.plane0 >> 7) & 1;
                int bit1 = (obj.plane1 >> 7) & 1;

                obj.plane0 <<= 1;
                obj.plane1 <<= 1;

                if (!bit0 && !bit1)
                {
                    continue;
                }

                output = (bit0 << 0) | (bit1 << 1) | ((obj.attribute & 3) << 2);
                active = i;
            }
        }

        return 0x10 | output;
    }
}
