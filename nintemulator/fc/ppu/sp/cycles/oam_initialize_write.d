module fc.ppu.sp.cycles.oam_initialize_write;


import common.cycle;
import fc.ppu.sp.oam;


class OamInitializeWrite : Cycle
{
    private Oam oam;

    this(Oam oam)
    {
        this.oam = oam;
    }

    public override void execute()
    {
        oam.object[oam.objectIndex] = oam.latch;
        oam.objectIndex = (oam.objectIndex + 1) & 0x1f;
    }
}
