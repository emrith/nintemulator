module fc.ppu.sp.evaluation.copy_x;


import common.cycle;
import fc.ppu.sp.oam;
import fc.ppu.sp.evaluation.evaluation_cycles;


class CopyX : Cycle
{
    private Oam oam;

    this(Oam oam)
    {
        this.oam = oam;
    }

    public override void execute()
    {
        oam.object[oam.objectIndex] = oam.latch;
        oam.memoryIndex = (oam.memoryIndex + 1) & 0xff;
        oam.objectIndex = (oam.objectIndex + 1) & 0x1f;
        oam.phase = (oam.objectIndex == 0)
            ? EvaluationCycles.SkipYPhase
            : EvaluationCycles.CopyYPhase;
    }
}
