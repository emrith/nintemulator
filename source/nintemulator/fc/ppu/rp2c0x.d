module fc.ppu.rp2c0x;


import common.cycle;
import common.cycle_map_factory;
import fc.ppu.registers;


class RP2C0x(int H_PERIOD, int V_PERIOD)
{
    private Registers registers;

    private Cycle[H_PERIOD] raster;
    private Cycle[H_PERIOD][V_PERIOD] screen;

    this(CycleMapFactory!(H_PERIOD, V_PERIOD) cycles, Registers registers)
    {
        this.registers = registers;
        this.screen = cycles.createMap();
        this.raster = this.screen[0];
    }

    public void execute()
    {
        if (registers.bgEnabled || registers.spEnabled)
        {
            raster[registers.h].risingEdge();
        }

        if (++registers.h == H_PERIOD)
        {
            registers.h = 0;
            
            if (++registers.v == V_PERIOD)
            {
                registers.v = 0;

                static if (V_PERIOD == 262)
                {
                    if (registers.skipIdle)
                    {
                        registers.skipIdle = false;
                        registers.h = 1;
                    }
                }
            }

            raster = screen[registers.v];
        }
    }
}

alias RP2C02 = RP2C0x!(341, 262);
alias RP2C07 = RP2C0x!(341, 312);
