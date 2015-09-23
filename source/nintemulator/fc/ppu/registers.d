module fc.ppu.registers;


class Registers
{
    public bool bgClipped;
    public bool bgEnabled;
    public bool spClipped;
    public bool spEnabled;
    public bool skipIdle;
    public bool field;

    public ushort h;
    public ushort v;
    public ushort bgAddress;
    public ushort spAddress;
    public ubyte name;
    public ubyte attr;
    public ubyte bit0;
    public ubyte bit1;
    public ubyte status;
}
