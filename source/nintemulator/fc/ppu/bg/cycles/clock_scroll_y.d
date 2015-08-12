module fc.ppu.bg.cycles.clock_scroll_y;


import common.cycle;
import fc.ppu.bg.scroll;


class ClockScrollY : Cycle
{
    private Scroll scroll;

    this(Scroll scroll)
    {
        this.scroll = scroll;
    }

    public override void risingEdge()
    {
        if ((scroll.address & 0x7000) != 0x7000)
        {
            scroll.address += 0x1000;
        }
        else
        {
            scroll.address ^= 0x7000;

            if ((scroll.address & 0x03e0) == 0x03a0)
            {
                scroll.address ^= 0x0ba0;
            }
            else
            {
                if ((scroll.address & 0x03e0) == 0x3e0)
                {
                    scroll.address ^= 0x03e0;
                }
                else
                {
                    scroll.address += 0x0020;
                }
            }
        }
    }
    
    public override void fallingEdge()
    {
    }
}
