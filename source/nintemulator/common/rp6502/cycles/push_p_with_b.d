module common.rp6502.cycles.push_p_with_b;

import common.cycle;
import common.rp6502.pins;
import common.rp6502.registers;
import common.rp6502.status;

class PushPWithB : Cycle
{
    private Pins pins;
    private Registers registers;
    private Status status;

    this(Pins pins, Registers registers, Status status)
    {
        this.pins = pins;
        this.registers = registers;
        this.status = status;
    }

    public override void risingEdge()
    {
        pins.address = registers.sp;
        pins.data = status.pack(true);
        pins.read = false;

        registers.spl--;
    }

    public override void fallingEdge()
    {
    }
}
