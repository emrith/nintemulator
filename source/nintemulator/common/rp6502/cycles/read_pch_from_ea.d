module common.rp6502.cycles.read_pch_from_ea;

import common.cycle;
import common.rp6502.pins;
import common.rp6502.registers;


class ReadPCHFromEA : Cycle
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

        registers.pc++;
    }

    public override void fallingEdge()
    {
        registers.eah = pins.data;
    }
}