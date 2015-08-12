module fc.ppu.bg.cycles.bg_bit0_request;


import common.cycle;
import fc.ppu.bus;
import fc.ppu.registers;
import fc.ppu.bg.scroll;


class BgBit0Request : Cycle
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
        bus.address = registers.bgAddress | (registers.name << 4) | 0 | ((scroll.address >> 12) & 7);
        bus.read = true;
    }
    
    public override void fallingEdge()
    {
    }
}
