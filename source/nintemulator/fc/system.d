module fc.system;


import fc.cpu.rp2a0x;
import fc.ppu.rp2c0x;


class System
{
    private RP2A03 rp2a03;
    private RP2C02 rp2c02;

    this(RP2A03 rp2a03, RP2C02 rp2c02)
    {
        this.rp2a03 = rp2a03;
        this.rp2c02 = rp2c02;
    }

    public void execute()
    {
        rp2a03.execute();
        rp2c02.execute();
    }
}
