module fc.ppu.sp.evaluation.skip_y;


import common.cycle;
import fc.ppu.registers;
import fc.ppu.sp.oam;
import fc.ppu.sp.evaluation.evaluation_cycles;


class SkipY : Cycle
{
    private Oam oam;
    private Registers registers;

    this(Oam oam, Registers registers)
    {
        this.oam = oam;
        this.registers = registers;
    }

    public override void execute()
    {
        int compare = (registers.v - oam.latch) & 0x1ff;
        if (compare < 8)
        {
            registers.status |= 0x20;

            oam.memoryIndex = ((oam.memoryIndex + 1) & 0xff);
            oam.phase = EvaluationCycles.SkipNamePhase;
        }
        else
        {
            oam.memoryIndex = ((oam.memoryIndex + 4) & 0xfc) + ((oam.memoryIndex + 1) & 0x03);

            if ((oam.memoryIndex & 0xfc) == 0)
            {
                oam.phase = EvaluationCycles.SpinPhase;
            }
        }

        oam.latch = oam.object[oam.objectIndex];
    }
}
