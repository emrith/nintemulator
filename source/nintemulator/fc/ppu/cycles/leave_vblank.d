module fc.ppu.cycles.leave_vblank;


import common.cycle;
import fc.ppu.registers;


class LeaveVBlank : Cycle
{
    private Registers registers;

    this(Registers registers)
    {
        this.registers = registers;
    }

    public override void risingEdge()
    {
        registers.status &= 0b0001_1111;
    }
    
    public override void fallingEdge()
    {
    }
}
