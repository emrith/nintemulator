module fc.ppu.bg.cycles.bg_attr_response;


import common.cycle;
import fc.ppu.bus;
import fc.ppu.registers;
import fc.ppu.bg.scroll;


class BgAttrResponse : Cycle
{
    private Bus bus;
    private Registers registers;
    private Scroll scroll;

    this(Bus bus, Registers registers, Scroll scroll)
    {
        this.bus = bus;
        this.registers = registers;
        this.scroll = scroll;
    }

    public override void execute()
    {
        int x = (scroll.Address >> 0) & 2;
        int y = (scroll.Address >> 4) & 4;

        registers.Attr = (bus.Data >> (y | x)) & 3;
        bus.Read = false;
    }
}
