module fc.ppu.sp.cycles.oam_read_index;


import common.cycle;
import fc.ppu.registers;
import fc.ppu.sp.oam;


class OamReadIndex : Cycle
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
        auto index = ((registers.H - 1) & 0x38) >> 3;
		auto value = oam.Output[index];

        switch (registers.H & 7)
        {
        case 0: index = (index << 2) | registers.H & 3; value.Y = oam.Memory[index]; break;
        case 1: index = (index << 2) | registers.H & 3; value.Name = oam.Memory[index]; break;
        case 2: index = (index << 2) | registers.H & 3; value.Attribute = oam.Memory[index]; break;
        case 3: index = (index << 2) | registers.H & 3; value.X = oam.Memory[index]; break;
        case 4: index = (index << 2) | 3; break;
        case 5: index = (index << 2) | 3; break;
        case 6: index = (index << 2) | 3; break;
        case 7: index = (index << 2) | 3; break;
        }

        oam.Latch = oam.Object[index];
        oam.MemoryIndex = 0;
        oam.ObjectIndex = 0;
        oam.Phase = 0;
        oam.Object0InLine = oam.Object0Found;
    }
}
