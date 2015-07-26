﻿module fc.ppu.sp.cycles.sp_bit1_response;


import common.cycle;
import fc.ppu.bus;
import fc.ppu.registers;
import fc.ppu.sp.oam;
import fc.ppu.sp.sp_output_unit;


class SpBit1Response : Cycle
{
    private Bus bus;
    private Registers registers;
    private Oam oam;
    private SpOutputUnit spOutputUnit;

    this(Bus bus, Registers registers, Oam oam, SpOutputUnit spOutputUnit)
    {
        this.bus = bus;
        this.registers = registers;
        this.oam = oam;
        this.spOutputUnit = spOutputUnit;
    }

    public override void execute()
    {
        auto index = (registers.H - 257) / 8;
		auto value = oam.Output[index];

        if (value.X == 0xff)
        {
            value.Plane1 = 0;
        }
        else
        {
            value.Plane1 = bus.Data;
        }

        bus.Read = false;
    }
}
