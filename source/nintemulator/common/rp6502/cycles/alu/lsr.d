module common.rp6502.cycles.alu.lsr;


import common.cycle;
import common.rp6502.alu;
import common.rp6502.pins;
import common.rp6502.status;


class LSR : Cycle
{
    private ALU alu;
    private Pins pins;
    private Status status;
    
    this(ALU alu, Pins pins, Status status)
    {
        this.alu = alu;
        this.pins = pins;
        this.status = status;
    }
    
    public override void risingEdge()
    {
        pins.data = alu.shr(pins.data, 0);
        status.n = pins.data >> 7;
        status.z = pins.data == 0;
        status.c = alu.c;
    }
    
    public override void fallingEdge()
    {
    }
}
