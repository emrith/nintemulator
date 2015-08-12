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

    public override void risingEdge()
    {
        oam.latch = oam.memory[oam.memoryIndex];
    }
    
    public override void fallingEdge()
    {
    }
}
