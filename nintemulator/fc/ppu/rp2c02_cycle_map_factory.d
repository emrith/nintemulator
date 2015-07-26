module fc.ppu.rp2c02_cycle_map_factory;


import common.cycle;
import common.cycle_mapper;
import common.cycle_map_factory;
import fc.ppu.rp2c02_cycles;


class RP2C02CycleMapFactory : CycleMapFactory!(341, 262)
{
    private RP2C02Cycles cycles;
    private CycleMapper!(341, 262)[] cycleMappers;

	this(RP2C02Cycles cycles, CycleMapper!(341, 262)[] cycleMappers)
    {
        this.cycles = cycles;
        this.cycleMappers = cycleMappers;
    }

    public Cycle[341][262] createMap()
    {
		Cycle[341][262] screen;

		foreach (cycleMapper; cycleMappers)
        {
            cycleMapper.mapTo(screen);
        }

        foreach (int v; 0 .. 240)
        {
            for (int h = 2; h <= 257; h += 1)
            {
                screen[v][h] += cycles.output;
            }

            for (int h = 9; h <= 257; h += 8)
            {
                screen[v][h] += cycles.latchTiles;
            }

            for (int h = 329; h <= 337; h += 8)
            {
                screen[v][h] += cycles.latchTiles;
            }
        }

        screen[241][  1] += cycles.enterVBlank;
        screen[261][  1] += cycles.leaveVBlank;
        screen[261][336] += cycles.idleSkipDetermination;
        screen[261][329] += cycles.latchTiles;
        screen[261][337] += cycles.latchTiles;

        return screen;
    }
}
