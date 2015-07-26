module fc.ppu.bg.cycles.bg_name_request;


import common.cycle;
import fc.ppu.bus;
import fc.ppu.bg.scroll;


class BgNameRequest : Cycle
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
        bus.Address = 0x2000 | (scroll.Address & 0xfff);
        bus.Read = true;
    }
}
