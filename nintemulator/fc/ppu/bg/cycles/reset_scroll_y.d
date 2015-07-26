module fc.ppu.bg.cycles.reset_scroll_y;


import common.cycle;
import fc.ppu.bg.scroll;


class ResetScrollY : Cycle
{
    private Scroll scroll;

    this(Scroll scroll)
    {
        this.scroll = scroll;
    }

    public override void execute()
    {
        scroll.Address = (scroll.Address & ~0x7be0) | (scroll.Latch & 0x7be0);
    }
}
