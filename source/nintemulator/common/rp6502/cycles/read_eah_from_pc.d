﻿module common.rp6502.cycles.read_eah_from_pc;


import common.cycle;
import common.rp6502.pins;
import common.rp6502.registers;


class ReadEAHFromPC : Cycle
{
    private Pins pins;
    private Registers registers;
    
    this(Pins pins, Registers registers)
    {
        this.pins = pins;
        this.registers = registers;
    }
    
    public override void risingEdge()
    {
        pins.address = registers.pc;
        pins.read = true;
        
        registers.pc++;
    }
    
    public override void fallingEdge()
    {
        registers.eah = pins.data;
    }
}
