module common.rp6502.cycles.read_pcl_from_sp;


import common.cycle;
import common.rp6502.pins;
import common.rp6502.registers;


class ReadPCLFromSP : Cycle
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
        pins.address = registers.sp;
        pins.read = true;
        
        registers.spl++;
    }
    
    public override void fallingEdge()
    {
        registers.pcl = pins.data;
    }
}
