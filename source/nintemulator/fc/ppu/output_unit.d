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

    public int getOutputColor()
    {
        auto colorIndex = getOutputColorIndex();
        auto color = paletteMemory.getData(colorIndex);

        return color;
    }

    public int getOutputColorIndex()
    {
        auto bgColor = bgOutputUnit.getOutputColor();
        auto spColor = spOutputUnit.getOutputColor();

        if (registers.h < 10)
        {
            if (registers.bgClipped) { bgColor = 0; }
            if (registers.spClipped) { spColor = 0; }
        }

        if (!(bgColor & 3) && !(spColor & 3))
        {
            return 0; // Really, this is from the EXT pins which are grounded in the Famicom.
        }

        if (!(bgColor & 3))
        {
            return spColor;
        }

        if (!(spColor & 3))
        {
            return bgColor;
        }

        if (spOutputUnit.active == 0 && oam.object0InLine)
        {
            registers.status |= 0x40;
        }
        
        return spOutputUnit.priority() ? spColor : bgColor;
    }
}
