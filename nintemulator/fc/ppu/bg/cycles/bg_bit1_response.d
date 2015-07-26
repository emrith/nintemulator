module fc.ppu.bg.cycles.bg_bit1_response;


import common.cycle;
import fc.ppu.bus;
import fc.ppu.registers;


class BgBit1Response : Cycle
{
    private Bus bus;
    private Registers registers;

    this(Bus bus, Registers registers)
    {
        this.bus = bus;
        this.registers = registers;
    }

    public override void execute()
    {
        registers.Bit1 = bus.Data;
        bus.Read = false;
    }
}
