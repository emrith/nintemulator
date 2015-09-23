module fc.ppu.palette_memory;


class PaletteMemory
{
    private ubyte[32] memory;

    public ubyte getData(int address)
    {
        return memory[calculateAddress(address)];
    }

    public void setData(int address, ubyte data)
    {
        memory[calculateAddress(address)] = data;
    }

    private int calculateAddress(int address)
    {
        return (address & 3) == 0 ? (address & 0x0f) : (address & 0x1f);
    }
}
