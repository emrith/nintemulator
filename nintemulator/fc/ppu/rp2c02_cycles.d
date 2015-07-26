module fc.ppu.rp2c02_cycles;


import fc.ppu.cycles.idle_skip_determination;
import fc.ppu.cycles.latch_tiles;
import fc.ppu.cycles.output_cycle;
import fc.ppu.cycles.enter_vblank;
import fc.ppu.cycles.leave_vblank;


class RP2C02Cycles
{
	public IdleSkipDetermination idleSkipDetermination;
	public LatchTiles latchTiles;
	public OutputCycle output;
	public EnterVBlank enterVBlank;
	public LeaveVBlank leaveVBlank;
}
