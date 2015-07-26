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
        if (registers.BgEnabled || registers.SpEnabled)
        {
            raster[registers.H].execute();
        }

        if (++registers.H == H_PERIOD)
        {
            registers.H = 0;
            
            if (++registers.V == V_PERIOD)
            {
                registers.V = 0;

				static if (V_PERIOD == 262)
				{
	                if (registers.SkipIdle)
	                {
	                    registers.SkipIdle = false;
	                    registers.H = 1;
	                }
				}
            }

            raster = screen[registers.V];
        }
    }
}

alias RP2C0x!(341, 262) RP2C02;
alias RP2C0x!(341, 312) RP2C07;
