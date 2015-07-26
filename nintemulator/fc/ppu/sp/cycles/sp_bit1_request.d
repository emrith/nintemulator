module fc.ppu.sp.cycles.sp_bit1_request;


import common.cycle;
import fc.ppu.bus;
import fc.ppu.registers;
import fc.ppu.sp.oam;


class SpBit1Request : Cycle
{
    private Bus bus;
    private Registers registers;
    private Oam oam;

    this(Bus bus, Registers registers, Oam oam)
    {
        this.bus = bus;
        this.registers = registers;
        this.oam = oam;
    }

    public override void execute()
    {
        auto index = (registers.H - 257) / 8;
		auto value = oam.Output[index];
		auto line = registers.V - value.Y;

        bus.Address = registers.SpAddress | (value.Name << 4) | 8 | (line & 7);
        bus.Read = true;
    }
}
