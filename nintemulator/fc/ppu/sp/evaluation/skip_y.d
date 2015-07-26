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
        int compare = (registers.V - oam.Latch) & 0x1ff;
        if (compare < 8)
        {
            registers.Status |= 0x20;

            oam.MemoryIndex = ((oam.MemoryIndex + 1) & 0xff);
            oam.Phase = EvaluationCycles.SkipNamePhase;
        }
        else
        {
            oam.MemoryIndex = ((oam.MemoryIndex + 4) & 0xfc) + ((oam.MemoryIndex + 1) & 0x03);

            if ((oam.MemoryIndex & 0xfc) == 0)
            {
                oam.Phase = EvaluationCycles.SpinPhase;
            }
        }

        oam.Latch = oam.Object[oam.ObjectIndex];
    }
}
