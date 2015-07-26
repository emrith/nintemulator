module fc.ppu.sp.evaluation.spin;


import common.cycle;
import fc.ppu.sp.oam;


class Spin : Cycle
{
    private Oam oam;

    this(Oam oam)
    {
        this.oam = oam;
    }

    public override void execute()
    {
        oam.Latch = oam.Object[oam.ObjectIndex];
        oam.MemoryIndex = ((oam.MemoryIndex + 4) & 0xfc);
    }
}
