module common.rp6502.cycles.alu.adc;


import common.cycle;
import common.rp6502.alu;
import common.rp6502.pins;
import common.rp6502.registers;
import common.rp6502.status;


class ADC : Cycle
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
        registers.a = alu.add(registers.a, pins.data, status.c);
        status.n = registers.a >> 7;
        status.z = registers.a == 0;
        status.c = alu.c;
        status.v = alu.v;
    }
    
    public override void fallingEdge()
    {
    }
}
