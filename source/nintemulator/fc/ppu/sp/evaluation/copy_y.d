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
        oam.object[oam.objectIndex] = oam.latch;

        int compare = (registers.v - oam.latch) & 0x1ff;
        if (compare < 8)
        {
            if (oam.objectIndex == 0)
            {
                oam.object0Found = true;
            }

            oam.memoryIndex = ((oam.memoryIndex + 1) & 0xff);
            oam.objectIndex = ((oam.objectIndex + 1) & 0x1f);
            oam.phase = EvaluationCycles.CopyNamePhase;
        }
        else
        {
            oam.memoryIndex = ((oam.memoryIndex + 4) & 0xff);

            if (oam.memoryIndex == 0)
            {
                oam.phase = EvaluationCycles.SpinPhase;
            }
        }
    }
}
