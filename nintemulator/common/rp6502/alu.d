module common.rp6502.alu;


class ALU
{
    public ubyte c;
    public ubyte v;

    public ubyte shl(ubyte value, int carry = 0)
    {
        asm
        {
            clc;
            ror carry, 1;
            rcl value, 1;
            // setc c;
        }

        return value;
    }

    public ubyte shr(ubyte value, int carry = 0)
    {
        asm
        {
            clc;
            ror carry, 1;
            rcr carry, 1;
            // setc c;
        }

        return value;
    }
}
