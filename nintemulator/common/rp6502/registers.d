module common.rp6502.registers;


import common.register16;


class Registers
{
    public ubyte a;
    public ubyte x;
    public ubyte y;
    public ubyte t;
    public ubyte ir;

    mixin(Register16!("ea"));
    mixin(Register16!("pc"));
    mixin(Register16!("sp"));
}
