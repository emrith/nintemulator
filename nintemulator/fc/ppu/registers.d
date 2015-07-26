module fc.ppu.registers;


class Registers
{
    public bool BgClipped;
    public bool BgEnabled;
    public bool SpClipped;
    public bool SpEnabled;
    public bool SkipIdle;
    public bool Field;

    public ushort H;
    public ushort V;
    public ushort BgAddress;
    public ushort SpAddress;
    public ubyte Name;
    public ubyte Attr;
    public ubyte Bit0;
    public ubyte Bit1;
    public ubyte Status;
}
