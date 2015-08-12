module fc.ppu.sp.evaluation.skip_name;


import common.cycle;
import fc.ppu.sp.oam;
import fc.ppu.sp.evaluation.evaluation_cycles;


class SkipName : Cycle
{
    private Oam oam;

    this(Oam oam)
    {
        this.oam = oam;
    }

    public override void risingEdge()
    {
        oam.latch = oam.object[oam.objectIndex];
        oam.memoryIndex = (oam.memoryIndex + 1) & 0xff;
        oam.phase = EvaluationCycles.SkipAttributePhase;
    }
    
    public override void fallingEdge()
    {
    }
}
