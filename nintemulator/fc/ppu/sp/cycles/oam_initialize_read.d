module fc.ppu.sp.cycles.oam_initialize_read;


import common.cycle;
import fc.ppu.sp.oam;


class OamInitializeRead : Cycle
{
    private Oam oam;

    this(Oam oam)
    {
        this.oam = oam;
    }

    public override void execute()
    {
        oam.Latch = 0xff;
    }
}
