module common.rp6502.cycles.fetch_from_sp_request;


import common.cycle;
import common.rp6502.bus;
import common.rp6502.registers;


class FetchFromSPRequest : Cycle
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
        bus.address = registers.sp;
        bus.read = true;

        registers.spl++;
    }
}
