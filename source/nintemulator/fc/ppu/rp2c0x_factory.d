module fc.ppu.rp2c0x_factory;


import common.cycle_mapper;
import fc.ppu.bg.bg_cycle_mapper;
import fc.ppu.bg.bg_cycles;
import fc.ppu.bg.bg_output_unit;
import fc.ppu.bg.scroll;
import fc.ppu.bus;
import fc.ppu.output_unit;
import fc.ppu.palette_memory;
import fc.ppu.registers;
import fc.ppu.rp2c02_cycle_map_factory;
import fc.ppu.rp2c0x;
import fc.ppu.rp2c0x_cycles;
import fc.ppu.sp.oam;
import fc.ppu.sp.sp_cycle_mapper;
import fc.ppu.sp.sp_cycles;
import fc.ppu.sp.sp_output_unit;
import fc.system;


class RP2C0xFactory
{
    public RP2C02 create()
    {
        auto bus = new Bus();
        auto oam = new Oam();
        auto palette = new PaletteMemory();
        auto registers = new Registers();
        auto scroll = new Scroll();
        
        auto bg_output_unit = new BgOutputUnit(registers, scroll);
        auto sp_output_unit = new SpOutputUnit(oam);
        auto output_unit = new OutputUnit(bg_output_unit, sp_output_unit, palette, oam, registers);
        
        auto bg_cycles = new BgCycles(bus, registers, scroll);
        auto sp_cycles = new SpCycles(bus, registers, scroll, oam, sp_output_unit);
        
        CycleMapper!(341, 262) bg_cycle_mapper = new BgCycleMapper(bg_cycles);
        CycleMapper!(341, 262) sp_cycle_mapper = new SpCycleMapper(sp_cycles, oam);
        
        auto rp2c02_cycles = new RP2C02Cycles(registers, bg_output_unit, output_unit);
        auto rp2c02_cycle_map_factory = new RP2C02CycleMapFactory(rp2c02_cycles, [ bg_cycle_mapper, sp_cycle_mapper ]);

        return new RP2C02(rp2c02_cycle_map_factory, registers);
    }
}
