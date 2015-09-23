module common.rp6502.core;


import common.cycle;
import common.rp6502.bus;
import common.rp6502.registers;


class Core
{
    private Bus bus;
    private Registers registers;
    private Cycle[8][256] cycles;

    public void execute()
    {
        if (bus.ready)
        {
            cycles[registers.ir][registers.t].execute();
        }
    }
}
