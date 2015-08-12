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

    public override void risingEdge()
    {
        oam.latch = 0xff;
    }
    
    public override void fallingEdge()
    {
    }
}
