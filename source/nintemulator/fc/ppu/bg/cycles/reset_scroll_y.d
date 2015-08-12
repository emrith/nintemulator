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

    public override void risingEdge()
    {
        scroll.address = (scroll.address & ~0x7be0) | (scroll.latch & 0x7be0);
    }
    
    public override void fallingEdge()
    {
    }
}
