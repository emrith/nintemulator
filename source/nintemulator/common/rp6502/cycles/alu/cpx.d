module common.rp6502.cycles.alu.cpx;


import common.cycle;
import common.rp6502.alu;
import common.rp6502.pins;
import common.rp6502.registers;
import common.rp6502.status;


class CPX : Cycle
{
    private ALU alu;
    private Pins pins;
    private Registers registers;
    private Status status;
    
    this(ALU alu, Pins pins, Registers registers, Status status)
    {
        this.alu = alu;
        this.pins = pins;
        this.registers = registers;
        this.status = status;
    }
    
    public override void risingEdge()
    {
        auto temp = alu.sub(registers.x, pins.data);
        status.n = temp >> 7;
        status.z = temp == 0;
        status.c = alu.c;
    }
    
    public override void fallingEdge()
    {
    }
}
