module fc.ppu.sp.cycles.sp_bit0_request;


import common.cycle;
import fc.ppu.bus;
import fc.ppu.registers;
import fc.ppu.sp.oam;


class SpBit0Request : Cycle
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

    public override void risingEdge()
    {
        auto index = (registers.h - 257) / 8;
        auto value = oam.Output[index];
        auto line = registers.v - value.y;

        bus.address = registers.spAddress | (value.name << 4) | 0 | (line & 7);
        bus.read = true;
    }
    
    public override void fallingEdge()
    {
    }
}
