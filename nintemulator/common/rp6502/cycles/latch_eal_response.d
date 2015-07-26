module common.rp6502.cycles.latch_eal_response;


import common.cycle;
import common.rp6502.bus;
import common.rp6502.registers;


class LatchEALResponse : Cycle
{
    private Bus bus;
    private Registers registers;

    this(Bus bus, Registers registers)
    {
        this.bus = bus;
        this.registers = registers;
    }

    public override void execute()
    {
        registers.eal = bus.data;
    }
}
