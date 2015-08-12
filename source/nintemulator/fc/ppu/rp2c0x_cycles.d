module fc.ppu.rp2c0x_cycles;


import fc.ppu.bg.bg_output_unit;
import fc.ppu.registers;
import fc.ppu.output_unit;
import fc.ppu.cycles.idle_skip_determination;
import fc.ppu.cycles.latch_tiles;
import fc.ppu.cycles.output;
import fc.ppu.cycles.enter_vblank;
import fc.ppu.cycles.leave_vblank;


class RP2C02Cycles
{
    public IdleSkipDetermination idleSkipDetermination;
    public LatchTiles latchTiles;
    public Output output;
    public EnterVBlank enterVBlank;
    public LeaveVBlank leaveVBlank;

    this(Registers registers, BgOutputUnit bgOutputUnit, OutputUnit outputUnit)
    {
        idleSkipDetermination = new IdleSkipDetermination(registers);
        latchTiles = new LatchTiles(bgOutputUnit, registers);
        output = new Output(registers, outputUnit, null);
        enterVBlank = new EnterVBlank(registers);
        leaveVBlank = new LeaveVBlank(registers);
    }
}
