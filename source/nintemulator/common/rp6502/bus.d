module common.rp6502.bus;


class Bus
{
    public ushort address;
    public ubyte data;
    public bool read;
    public bool ready;
}
