module common.rp6502.cycles.push_pch;


import common.cycle;
import common.rp6502.pins;
import common.rp6502.registers;


class PushPCHRequest : Cycle
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
        pins.data = registers.pch;
        pins.read = false;

        registers.spl--;
    }
    
    public override void fallingEdge()
    {
    }
}
