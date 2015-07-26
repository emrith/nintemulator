module fc.ppu.sp.oam;


class Oam
{
    public ubyte[256] memory;
    public ubyte[32] object;
    public int memoryIndex;
    public int objectIndex;
    public ubyte latch;
    public ubyte phase;
    public bool object0InLine;
    public bool object0Found;

    // 
    // Output variables
    // 

    public OamObject[8] Output;
}

struct OamObject
{
    public ubyte y;
    public ubyte name;
    public ubyte attribute;
    public ubyte x;
    public ubyte plane0;
    public ubyte plane1;
}
