module fc.ppu.sp.evaluation.copy_y;


import common.cycle;
import fc.ppu.registers;
import fc.ppu.sp.oam;
import fc.ppu.sp.evaluation.evaluation_cycles;


class CopyY : Cycle
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
        oam.Object[oam.ObjectIndex] = oam.Latch;

        int compare = (registers.V - oam.Latch) & 0x1ff;
        if (compare < 8)
        {
            if (oam.ObjectIndex == 0)
            {
                oam.Object0Found = true;
            }

            oam.MemoryIndex = ((oam.MemoryIndex + 1) & 0xff);
            oam.ObjectIndex = ((oam.ObjectIndex + 1) & 0x1f);
            oam.Phase = EvaluationCycles.CopyNamePhase;
        }
        else
        {
            oam.MemoryIndex = ((oam.MemoryIndex + 4) & 0xff);

            if (oam.MemoryIndex == 0)
            {
                oam.Phase = EvaluationCycles.SpinPhase;
            }
        }
    }
}
