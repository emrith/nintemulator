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

    public override void execute()
    {
        if ((scroll.Address & 0x7000) != 0x7000)
        {
            scroll.Address += 0x1000;
        }
        else
        {
            scroll.Address ^= 0x7000;

            if ((scroll.Address & 0x03e0) == 0x03a0)
            {
                scroll.Address ^= 0x0ba0;
            }
            else
            {
                if ((scroll.Address & 0x03e0) == 0x3e0)
                {
                    scroll.Address ^= 0x03e0;
                }
                else
                {
                    scroll.Address += 0x0020;
                }
            }
        }
    }
}
