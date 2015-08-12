module fc.ppu.cycles.enter_vblank;


import common.cycle;
import fc.ppu.registers;


class EnterVBlank : Cycle
{
    private Registers registers;

    this(Registers registers)
    {
        this.registers = registers;
    }

    public override void risingEdge()
    {
        registers.status |= 0b1000_0000;
    }
    
    public override void fallingEdge()
    {
    }
}
