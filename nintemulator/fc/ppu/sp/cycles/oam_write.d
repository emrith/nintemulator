module fc.ppu.sp.cycles.oam_write;


import common.cycle;
import fc.ppu.sp.oam;
import fc.ppu.sp.evaluation.evaluation_cycles;


class OamWrite : Cycle
{
    private Oam oam;
    private Cycle[] phases;

    this(Oam oam, EvaluationCycles cycles)
    {
        this.oam = oam;
        this.phases = new Cycle[EvaluationCycles.PhaseCount];
        this.phases[EvaluationCycles.CopyYPhase] = cycles.copyY;
		this.phases[EvaluationCycles.CopyNamePhase] = cycles.copyName;
		this.phases[EvaluationCycles.CopyAttributePhase] = cycles.copyAttribute;
		this.phases[EvaluationCycles.CopyXPhase] = cycles.copyX;
		this.phases[EvaluationCycles.SkipYPhase] = cycles.skipY;
		this.phases[EvaluationCycles.SkipNamePhase] = cycles.skipName;
		this.phases[EvaluationCycles.SkipAttributePhase] = cycles.skipAttribute;
		this.phases[EvaluationCycles.SkipXPhase] = cycles.skipX;
		this.phases[EvaluationCycles.SpinPhase] = cycles.spin;
    }

    public override void execute()
    {
        this.phases[oam.Phase].execute();
    }
}
