module fc.system_factory;


import common.cycle_mapper;
import fc.cpu.rp2a0x_factory;
import fc.ppu.rp2c0x_factory;
import fc.system;


class SystemFactory
{
    public System create()
    {
        auto cpuFactory = new RP2A0xFactory();
        auto ppuFactory = new RP2C0xFactory();

        return new System(
            cpuFactory.create(),
            ppuFactory.create()
        );
    }
}
