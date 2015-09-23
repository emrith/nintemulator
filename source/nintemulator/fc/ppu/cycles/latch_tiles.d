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
        bgOutput.plane0 = (bgOutput.plane0 << 8) | registers.bit0;
        bgOutput.plane1 = (bgOutput.plane1 << 8) | registers.bit1;
        bgOutput.attribute0 = (bgOutput.attribute0 << 8) | AttributeLatches[(registers.attr >> 0) & 1];
        bgOutput.attribute1 = (bgOutput.attribute1 << 8) | AttributeLatches[(registers.attr >> 1) & 1];
    }
}
