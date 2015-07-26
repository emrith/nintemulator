module fc.ppu.bus;


struct Bus
{
    public ushort Address;
    public ubyte Data;
    public bool AddressLatchEnable;
    public bool Read;
    public bool Write;
}
