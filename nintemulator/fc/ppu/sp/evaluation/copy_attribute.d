module fc.ppu.sp.evaluation.copy_attribute;


import common.cycle;
import fc.ppu.sp.oam;
import fc.ppu.sp.evaluation.evaluation_cycles;


class CopyAttribute : Cycle
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
        oam.phase = EvaluationCycles.CopyXPhase;
    }
}
