module fc.ppu.bg.cycles.reset_scroll_x;


import common.cycle;
import fc.ppu.bg.scroll;


class ResetScrollX : Cycle
{
    private Scroll scroll;

    this(Scroll scroll)
    {
        this.scroll = scroll;
    }

    public override void execute()
    {
        scroll.Address = (scroll.Address & ~0x041f) | (scroll.Latch & 0x041f);
    }
}
