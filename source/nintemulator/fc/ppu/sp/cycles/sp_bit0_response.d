module fc.ppu.sp.cycles.sp_bit0_response;


import common.cycle;
import fc.ppu.bus;
import fc.ppu.registers;
import fc.ppu.sp.oam;
import fc.ppu.sp.sp_output_unit;


class SpBit0Response : Cycle
{
    private Bus bus;
    private Registers registers;
    private Oam oam;
    private SpOutputUnit spOutputUnit;

    this(Bus bus, Registers registers, Oam oam, SpOutputUnit spOutputUnit)
    {
        this.bus = bus;
        this.registers = registers;
        this.oam = oam;
        this.spOutputUnit = spOutputUnit;
    }

    public override void risingEdge()
    {
        auto index = (registers.h - 257) / 8;
        auto value = oam.Output[index];

        if (value.x == 0xff)
        {
            value.plane0 = 0;
        }
        else
        {
            value.plane0 = bus.data;
        }

        bus.read = false;
    }
    
    public override void fallingEdge()
    {
    }
}
