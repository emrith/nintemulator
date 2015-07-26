module fc.ppu.sp.cycles.oam_read;


import common.cycle;
import fc.ppu.sp.oam;


class OamRead : Cycle
{
    private Oam oam;

    this(Oam oam)
    {
        this.oam = oam;
    }

    public override void execute()
    {
        oam.Latch = oam.Memory[oam.MemoryIndex];
    }
}
