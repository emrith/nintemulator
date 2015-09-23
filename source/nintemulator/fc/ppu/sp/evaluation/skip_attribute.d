module fc.ppu.sp.evaluation.skip_attribute;


import common.cycle;
import fc.ppu.sp.oam;
import fc.ppu.sp.evaluation.evaluation_cycles;


class SkipAttribute : Cycle
{
    private Oam oam;

    this(Oam oam)
    {
        this.oam = oam;
    }

    public override void execute()
    {
        oam.latch = oam.object[oam.objectIndex];
        oam.memoryIndex = (oam.memoryIndex + 1) & 0xff;
        oam.phase = EvaluationCycles.SkipXPhase;
    }
}
