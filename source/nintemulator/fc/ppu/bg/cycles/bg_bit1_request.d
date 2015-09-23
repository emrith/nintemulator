module fc.ppu.bg.cycles.bg_bit1_request;


import common.cycle;
import fc.ppu.bus;
import fc.ppu.registers;
import fc.ppu.bg.scroll;


class BgBit1Request : Cycle
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
        bus.address = registers.bgAddress | (registers.name << 4) | 8 | ((scroll.address >> 12) & 7);
        bus.read = true;
    }
}
