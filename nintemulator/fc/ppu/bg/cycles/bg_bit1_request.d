module fc.ppu.bg.cycles.bg_bit1_request;


import common.cycle;
import fc.ppu.bus;
import fc.ppu.registers;
import fc.ppu.bg.scroll;


class BgBit1Request : Cycle
{
    private Bus bus;
    private Registers registers;
    private Scroll scroll;

    this(Bus bus, Registers registers, Scroll scroll)
    {
        this.bus = bus;
        this.registers = registers;
        this.scroll = scroll;
    }

    public override void execute()
    {
        bus.Address = registers.BgAddress | (registers.Name << 4) | 8 | ((scroll.Address >> 12) & 7);
        bus.Read = true;
    }
}
