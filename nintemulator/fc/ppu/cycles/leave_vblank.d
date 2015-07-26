module fc.ppu.cycles.leave_vblank;


import common.cycle;
import fc.ppu.registers;


class LeaveVBlank : Cycle
{
    private Registers registers;

    this(Registers registers)
    {
        this.registers = registers;
    }

    public override void execute()
    {
        registers.Status &= 0x1f; // 0b0001_1111
    }
}
