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

    public override void risingEdge()
    {
        oam.latch = oam.object[oam.objectIndex];
        oam.memoryIndex = (oam.memoryIndex + 4) & 0xfc;
    }
    
    public override void fallingEdge()
    {
    }
}
