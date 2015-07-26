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
        auto index = ((registers.h - 1) & 0x38) >> 3;
        auto value = oam.Output[index];

        switch (registers.h & 7)
        {
        case 0: index = (index << 2) | registers.h & 3; value.y = oam.memory[index]; break;
        case 1: index = (index << 2) | registers.h & 3; value.name = oam.memory[index]; break;
        case 2: index = (index << 2) | registers.h & 3; value.attribute = oam.memory[index]; break;
        case 3: index = (index << 2) | registers.h & 3; value.x = oam.memory[index]; break;
        case 4: index = (index << 2) | 3; break;
        case 5: index = (index << 2) | 3; break;
        case 6: index = (index << 2) | 3; break;
        case 7: index = (index << 2) | 3; break;
        }

        oam.latch = oam.object[index];
        oam.memoryIndex = 0;
        oam.objectIndex = 0;
        oam.phase = 0;
        oam.object0InLine = oam.object0Found;
    }
}
