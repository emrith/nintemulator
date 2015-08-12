module common.rp6502.interrupts;


import common.rp6502.pins;
import common.rp6502.status;


enum
{
    VECTOR_NMI = 0xfffa,
    VECTOR_RES = 0xfffc,
    VECTOR_IRQ = 0xfffe
}

class Interrupts
{
    private Pins pins;
    private Status status;
    private bool irq;
    private bool nmi, nmi_latch;
    private bool res;

    this(Pins pins, Status status)
    {
        this.pins = pins;
        this.status = status;
    }

    public void update()
    {
        irq = pins.irq;
        res = pins.res;

        if (pins.nmi & !nmi_latch)
        {
            nmi = 1;
        }

        nmi_latch = pins.nmi;
    }

    public bool available()
    {
        return nmi | (irq & !status.i) | res;
    }

    public ushort vector()
    {
        status.i = 1;

        if (res) { res = 0; return VECTOR_RES; }
        if (nmi) { nmi = 0; return VECTOR_NMI; }
        if (irq) { irq = 0; return VECTOR_IRQ; }

        return 0;
    }
}