module common.rp6502.registers;


import common.register16;


class Registers
{
    public mixin(makeRegister16!("ea"));
    public mixin(makeRegister16!("pc"));
    public mixin(makeRegister16!("sp"));

    public ubyte a;
    public ubyte x;
    public ubyte y;

    // Internal registers
    // 

    public ubyte code;
    public ubyte time;
    public bool phi;
}
