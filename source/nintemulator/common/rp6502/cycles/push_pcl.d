module common.rp6502.cycles.push_pcl;


import common.cycle;
import common.rp6502.pins;
import common.rp6502.registers;


class PushPCLRequest : Cycle
{
    private Pins pins;
    private Registers registers;

    this(Pins pins, Registers registers)
    {
        this.pins = pins;
        this.registers = registers;
    }

    public override void risingEdge()
    {
        pins.address = registers.sp;
        pins.data = registers.pcl;
        pins.read = false;

        registers.spl--;
    }
    
    public override void fallingEdge()
    {
    }
}
