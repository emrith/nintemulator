﻿module fc.ppu.bg.cycles.clock_scroll_x;


import common.cycle;
import fc.ppu.bg.scroll;


class ClockScrollX : Cycle
{
    private Scroll scroll;

    this(Scroll scroll)
    {
        this.scroll = scroll;
    }

    public override void execute()
    {
        if ((scroll.address & 0x001f) == 0x001f)
        {
            scroll.address ^= 0x041f;
        }
        else
        {
            scroll.address += 0x0001;
        }
    }
}
