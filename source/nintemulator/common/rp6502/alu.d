module common.rp6502.alu;


class ALU
{
    public ubyte c;
    public ubyte v;

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

    public ubyte sub(ubyte lhs, ubyte rhs, int carry = 0)
    {
        return add(lhs, ~rhs, carry);
    }

    unittest
    {
        auto sut = new ALU();

        assert(sut.add(0xff, 0x00, 0) == 0xff);
        assert(sut.add(0xff, 0x00, 1) == 0x00);
        assert(sut.add(0xff, 0x01, 0) == 0x00);
        assert(sut.add(0xff, 0x01, 1) == 0x01);

        sut.c = 0;
        sut.add(0xff, 0x00, 1);

        assert(sut.c == 1);

        sut.c = 1;
        sut.add(0xff, 0x00, 0);

        assert(sut.c == 0);

        sut.v = 0;
        sut.add(0x80, 0x80, 0);

        assert(sut.v == 1);

        sut.v = 0;
        sut.add(0x80, 0x7f, 1);

        assert(sut.v == 0);
    }

    public ubyte shl(ubyte value, int carry = 0)
    {
        asm
        {
            ror carry, 1;
            rcl value, 1;
            setc c[EAX];
        }

        return value;
    }

    unittest
    {
        auto sut = new ALU();

        assert(sut.shl(0x80, 0) == 0x00);
        assert(sut.shl(0x40, 0) == 0x80);
        assert(sut.shl(0x80, 1) == 0x01);
        assert(sut.shl(0x40, 1) == 0x81);

        sut.c = 0;
        sut.shl(0x80, 0);

        assert(sut.c == 1);

        sut.c = 1;
        sut.shl(0x40, 0);

        assert(sut.c == 0);
    }

    public ubyte shr(ubyte value, int carry = 0)
    {
        asm
        {
            ror carry, 1;
            rcr value, 1;
            setc c[EAX];
        }

        return value;
    }

    unittest
    {
        auto sut = new ALU();

        assert(sut.shr(0x01, 0) == 0x00);
        assert(sut.shr(0x80, 0) == 0x40);
        assert(sut.shr(0x01, 1) == 0x80);
        assert(sut.shr(0x80, 1) == 0xc0);

        sut.c = 0;
        sut.shr(0x01, 0);

        assert(sut.c == 1);

        sut.c = 1;
        sut.shr(0x80, 0);

        assert(sut.c == 0);
    }
}
