module common.rp6502.cycles.read_pcl_from_interrupt_vector;

import common.cycle;
import common.rp6502.interrupts;
import common.rp6502.pins;
import common.rp6502.registers;

class ReadPCLFromInterruptVector : Cycle
{
    private Pins pins;
    private Registers registers;
    private Interrupts interrupts;

    this(Pins pins, Registers registers, Interrupts interrupts)
    {
        this.pins = pins;
        this.registers = registers;
        this.interrupts = interrupts;
    }

    public override void risingEdge()
    {
        registers.ea = interrupts.vector();
        pins.address = registers.ea;
        pins.read = true;

        registers.ea++;
    }

    public override void fallingEdge()
    {
        registers.pcl = pins.data;
    }
}