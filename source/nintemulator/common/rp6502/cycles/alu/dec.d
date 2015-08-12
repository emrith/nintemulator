module common.rp6502.cycles.alu.dec;


import common.cycle;
import common.rp6502.pins;
import common.rp6502.status;


class DEC : Cycle
{
    private Pins pins;
    private Status status;
    
    this(Pins pins, Status status)
    {
        this.pins = pins;
        this.status = status;
    }
    
    public override void risingEdge()
    {
        pins.data--;
        status.n = pins.data >> 7;
        status.z = pins.data == 0;
    }
    
    public override void fallingEdge()
    {
    }
}
