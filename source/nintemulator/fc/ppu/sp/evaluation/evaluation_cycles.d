module fc.ppu.sp.evaluation.evaluation_cycles;


import fc.ppu.registers;
import fc.ppu.sp.oam;
import fc.ppu.sp.evaluation.copy_attribute;
import fc.ppu.sp.evaluation.copy_name;
import fc.ppu.sp.evaluation.copy_x;
import fc.ppu.sp.evaluation.copy_y;
import fc.ppu.sp.evaluation.skip_attribute;
import fc.ppu.sp.evaluation.skip_name;
import fc.ppu.sp.evaluation.skip_x;
import fc.ppu.sp.evaluation.skip_y;
import fc.ppu.sp.evaluation.spin;


class EvaluationCycles
{
    public CopyY copyY;
    public CopyName copyName;
    public CopyAttribute copyAttribute;
    public CopyX copyX;
    public SkipY skipY;
    public SkipName skipName;
    public SkipAttribute skipAttribute;
    public SkipX skipX;
    public Spin spin;

    enum
    {
        CopyYPhase, CopyNamePhase, CopyAttributePhase, CopyXPhase,
        SkipYPhase, SkipNamePhase, SkipAttributePhase, SkipXPhase,
        SpinPhase,
        PhaseCount
    }

    this(Oam oam, Registers registers)
    {
        copyY = new CopyY(oam, registers);
        copyName = new CopyName(oam);
        copyAttribute = new CopyAttribute(oam);
        copyX = new CopyX(oam);
        skipY = new SkipY(oam, registers);
        skipName = new SkipName(oam);
        skipAttribute = new SkipAttribute(oam);
        skipX = new SkipX(oam);
        spin = new Spin(oam);
    }
}
