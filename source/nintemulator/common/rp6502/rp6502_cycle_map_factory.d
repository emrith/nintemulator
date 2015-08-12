module common.rp6502.rp6502_cycle_map_factory;


import common.cycle;
import common.cycle_map_factory;


class RP6502CycleMapFactory : CycleMapFactory!(8, 256)
{
    public Cycle[8][256] createMap()
    {
        Cycle[8][256] a;

        return a;
    }
}
