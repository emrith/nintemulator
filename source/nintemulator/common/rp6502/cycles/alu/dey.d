module common.rp6502.cycles.alu.dey;


import common.cycle;
import common.rp6502.registers;
import common.rp6502.status;


class DEY : Cycle
{
    private Registers registers;
    private Status status;
    
    this(Registers registers, Status status)
    {
        this.registers = registers;
        this.status = status;
    }
    
    public override void risingEdge()
    {
        registers.y--;
        status.n = registers.y >> 7;
        status.z = registers.y == 0;
    }
    
    public override void fallingEdge()
    {
    }
}
