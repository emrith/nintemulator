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
        oam.Object[oam.ObjectIndex] = oam.Latch;
        oam.MemoryIndex = (oam.MemoryIndex + 1) & 0xff;
        oam.ObjectIndex = (oam.ObjectIndex + 1) & 0x1f;
        oam.Phase = EvaluationCycles.CopyXPhase;
    }
}
