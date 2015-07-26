module fc.ppu.bg.cycles.bg_attr_request;


import common.cycle;
import fc.ppu.bus;
import fc.ppu.bg.scroll;


class BgAttrRequest : Cycle
{
    private Bus bus;
    private Scroll scroll;

    this(Bus bus, Scroll scroll)
    {
        this.bus = bus;
        this.scroll = scroll;
    }

    public override void execute()
    {
        bus.Address = 0x23c0 | (scroll.Address & 0xc00) | ((scroll.Address >> 4) & 0x38) | ((scroll.Address >> 2) & 7);
        bus.Read = true;
    }
}
