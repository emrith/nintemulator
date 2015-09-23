module fc.ppu.bg.bg_output_unit;


import fc.ppu.registers;
import fc.ppu.bg.scroll;


class BgOutputUnit
{
    private Registers registers;
    private Scroll scroll;

    public int plane0;
    public int plane1;
    public int attribute0;
    public int attribute1;

    this(Registers registers, Scroll scroll)
    {
        this.registers = registers;
        this.scroll = scroll;
    }

    public int getOutputColor()
    {
        auto pixel = (registers.h - 2) & 7;
        auto shift = 15 - (scroll.fine + pixel);

        auto bit0 = (plane0 >> shift) & 1;
        auto bit1 = (plane1 >> shift) & 1;
        auto att0 = (attribute0 >> shift) & 1;
        auto att1 = (attribute1 >> shift) & 1;

        return (bit0 << 0) | (bit1 << 1) | (att0 << 2) | (att1 << 3);
    }
}
