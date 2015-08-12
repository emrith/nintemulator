module common.rp6502.cycles.read_null_from_pc;


import common.cycle;
import common.rp6502.pins;
import common.rp6502.registers;

// Read at PC, increment pc then throw the data away (data will still in pins thus it still can be used).
class ReadNullFromPCThrowAway : Cycle
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
        pins.address = registers.pc;
        pins.read = true;

        registers.pc++;
    }

    public override void fallingEdge()
    {
    }
}
