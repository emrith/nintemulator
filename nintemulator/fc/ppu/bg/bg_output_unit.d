module fc.ppu.bg.bg_output_unit;


import fc.ppu.registers;
import fc.ppu.bg.scroll;


class BgOutputUnit
{
    private Registers registers;
    private Scroll scroll;

    public int Plane0;
    public int Plane1;
    public int Attribute0;
    public int Attribute1;

    this(Registers registers, Scroll scroll)
    {
        this.registers = registers;
        this.scroll = scroll;
    }

    public int getOutputColor()
    {
        auto pixel = (registers.H - 2) & 7;
		auto shift = 15 - (scroll.Fine + pixel);

		auto bit0 = (Plane0 >> shift) & 1;
		auto bit1 = (Plane1 >> shift) & 1;
		auto att0 = (Attribute0 >> shift) & 1;
		auto att1 = (Attribute1 >> shift) & 1;

        return (bit0 << 0) | (bit1 << 1) | (att0 << 2) | (att1 << 3);
    }
}
