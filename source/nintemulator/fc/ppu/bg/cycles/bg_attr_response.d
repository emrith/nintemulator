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

    public override void risingEdge()
    {
        int x = (scroll.address >> 0) & 2;
        int y = (scroll.address >> 4) & 4;

        registers.attr = (bus.data >> (y | x)) & 3;
        bus.read = false;
    }
    
    public override void fallingEdge()
    {
    }
}
