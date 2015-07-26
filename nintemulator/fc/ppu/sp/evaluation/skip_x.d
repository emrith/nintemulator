module fc.ppu.sp.evaluation.skip_x;


import common.cycle;
import fc.ppu.sp.oam;
import fc.ppu.sp.evaluation.evaluation_cycles;


class SkipX : Cycle
{
    private Oam oam;

    this(Oam oam)
    {
        this.oam = oam;
    }

    public override void execute()
    {
        oam.Latch = oam.Object[oam.ObjectIndex];
        oam.MemoryIndex = (oam.MemoryIndex + 1) & 0xff;
        oam.Phase = EvaluationCycles.SpinPhase;
    }
}
