module common.rp6502.alu;


class ALU
{
    public bool c;
    public bool v;

    public ubyte add(ubyte lhs, ubyte rhs, int carry = 0)
    {
        asm
        {
            ror carry, 1;
            mov ECX, EAX;
            mov AL, lhs;
            adc AL, rhs;
            setc c[ECX];
            seto v[ECX];
        }
    }

    public ubyte sub(ubyte left, ubyte right, int carry = 1)
    {
        return add(left, ~right, carry);
    }

    public ubyte shl(ubyte value, int carry = 0)
    {
        asm
        {
            mov ECX, EAX;
            ror carry, 1; // Get the `carry` flag into the host processor's `c` flag.
            mov AL, value;
            rcl AL, 1;
            setc c[ECX];
        }
    }

    public ubyte shr(ubyte value, int carry = 0)
    {
        asm
        {
            mov ECX, EAX;
            ror carry, 1; // Get the `carry` flag into the host processor's `c` flag.
            mov AL, value;
            rcr AL, 1;
            setc c[ECX];
        }
    }
}
