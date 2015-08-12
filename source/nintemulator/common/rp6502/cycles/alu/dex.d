module common.rp6502.cycles.alu.dex;


import common.cycle;
import common.rp6502.registers;
import common.rp6502.status;


class DEX : Cycle
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
        registers.x--;
        status.n = registers.x >> 7;
        status.z = registers.x == 0;
    }
    
    public override void fallingEdge()
    {
    }
}
