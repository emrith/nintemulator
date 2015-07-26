module fc.ppu.bg.cycles.bg_name_response;


import common.cycle;
import fc.ppu.bus;
import fc.ppu.registers;


class BgNameResponse : Cycle
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
        registers.Name = bus.Data;
        bus.Read = false;
    }
}
