module common.rp6502.cycles.read_null_from_ea;


import common.cycle;
import common.rp6502.pins;
import common.rp6502.registers;

// Read at EA then throw the data away (data will still in pins thus it still can be used).
class ReadNullFromEAThrowAway : Cycle
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
        pins.address = registers.ea;
        pins.read = true;
    }

    public override void fallingEdge()
    {
    }
}
