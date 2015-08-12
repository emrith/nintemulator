module common.rp6502.rp6502;


import common.cycle;
import common.rp6502.registers;
import common.rp6502.rp6502_cycle_map_factory;


class RP6502
{
    private Cycle[8][256] cycleMap;
    private Registers registers;

    this(RP6502CycleMapFactory cycleMapFactory, Registers registers)
    {
        this.registers = registers;
        this.cycleMap = cycleMapFactory.createMap();
    }

    public void execute()
    {
        auto cycle = cycleMap[registers.code][registers.time];

        if (registers.phi == 0)
        {
            cycle.risingEdge();
        }
        else
        {
            cycle.fallingEdge();
        }

        registers.phi ^= 1;
    }
}
