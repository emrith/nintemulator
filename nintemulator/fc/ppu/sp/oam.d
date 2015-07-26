module fc.ppu.sp.oam;


class Oam
{
	public ubyte[256] Memory;
	public ubyte[32] Object;
    public int MemoryIndex;
    public int ObjectIndex;
    public ubyte Latch;
    public ubyte Phase;
    public bool Object0InLine;
    public bool Object0Found;

    // 
    // Output variables
    // 

	public OamObject[8] Output;

    this()
    {
		for (int i = 0; i < 8; i++)
		{
			Output[i] = OamObject();
		}
    }
}

struct OamObject
{
    public ubyte Y;
    public ubyte Name;
    public ubyte Attribute;
    public ubyte X;
    public ubyte Plane0;
    public ubyte Plane1;
}
