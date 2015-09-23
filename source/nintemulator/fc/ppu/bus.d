module fc.ppu.bus;


class Bus
{
    public ushort address;
    public ubyte data;
    public bool addressLatchEnable;
    public bool read;
    public bool write;
}
