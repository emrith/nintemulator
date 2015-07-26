module fc.ppu.cycles.idle_skip_determination;


import common.cycle;
import fc.ppu.registers;


class IdleSkipDetermination : Cycle
{
    private Registers registers;

    this(Registers registers)
    {
        this.registers = registers;
    }

    public override void execute()
    {
        registers.SkipIdle = registers.Field;
    }
}
