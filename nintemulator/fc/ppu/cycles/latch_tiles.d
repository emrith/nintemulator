module fc.ppu.cycles.latch_tiles;


import common.cycle;
import fc.ppu.bg.bg_output_unit;
import fc.ppu.registers;


class LatchTiles : Cycle
{
    private static int[] AttributeLatches = [ 0, 0xff ];

	private BgOutputUnit bgOutput;
    private Registers registers;

	this(BgOutputUnit bgOutput, Registers registers)
    {
        this.bgOutput = bgOutput;
		this.registers = registers;
    }

    public override void execute()
    {
		bgOutput.Plane0 = (bgOutput.Plane0 << 8) | registers.Bit0;
		bgOutput.Plane1 = (bgOutput.Plane1 << 8) | registers.Bit1;
		bgOutput.Attribute0 = (bgOutput.Attribute0 << 8) | AttributeLatches[(registers.Attr >> 0) & 1];
		bgOutput.Attribute1 = (bgOutput.Attribute1 << 8) | AttributeLatches[(registers.Attr >> 1) & 1];
    }
}
