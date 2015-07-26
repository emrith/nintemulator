module fc.ppu.output_unit;


import fc.ppu.bg.bg_output_unit;
import fc.ppu.sp.sp_output_unit;
import fc.ppu.palette_memory;
import fc.ppu.sp.oam;
import fc.ppu.registers;


class OutputUnit
{
    private BgOutputUnit bgOutputUnit;
    private SpOutputUnit spOutputUnit;
    private PaletteMemory paletteMemory;
    private Oam oam;
    private Registers registers;

    this(BgOutputUnit bgOutputUnit, SpOutputUnit spOutputUnit, PaletteMemory paletteMemory, Oam oam, Registers registers)
    {
        this.bgOutputUnit = bgOutputUnit;
        this.spOutputUnit = spOutputUnit;
        this.paletteMemory = paletteMemory;
        this.oam = oam;
        this.registers = registers;
    }

    public int GetOutputColor()
    {
        auto bkgColor = bgOutputUnit.getOutputColor();
		auto objColor = spOutputUnit.getOutputColor();
		auto extColor = 0;

        if (registers.H < 10)
        {
            if (registers.BgClipped) { bkgColor = 0; }
            if (registers.SpClipped) { objColor = 0; }
        }

        if (!(bkgColor & 3) && !(objColor & 3))
        {
            return paletteMemory.getData(extColor);
        }

        if (!(bkgColor & 3))
        {
            return paletteMemory.getData(objColor);
        }

        if (!(objColor & 3))
        {
            return paletteMemory.getData(bkgColor);
        }

        if (spOutputUnit.Active == 0 && oam.Object0InLine)
        {
            registers.Status |= 0x40;
        }

        return paletteMemory.getData(spOutputUnit.priority()
            ? objColor
            : bkgColor);
    }
}
