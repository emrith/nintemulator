module fc.ppu.sp.sp_cycle_mapper;


import common.cycle;
import common.cycle_mapper;
import fc.ppu.sp.oam;
import fc.ppu.sp.sp_cycles;


class SpCycleMapper : CycleMapper!(341, 262)
{
    private SpCycles cycles;
    private Oam oam;

    this(SpCycles cycles, Oam oam)
    {
        this.cycles = cycles;
        this.oam = oam;
    }

    public override void mapTo(Cycle[341][262] array)
    {
        foreach (int v; 0 .. 240)
        {
            mapToRaster(array[v]);
        }

        mapToRaster(array[261]);
    }

    private void mapToRaster(Cycle[] raster)
    {
        for (int h = 1; h < 65; h += 2)
        {
            raster[h + 0] += cycles.oamInitializeRead;
            raster[h + 1] += cycles.oamInitializeWrite;
        }

        for (int h = 65; h < 257; h += 2)
        {
            raster[h + 0] += cycles.oamRead;
            raster[h + 1] += cycles.oamWrite;
        }

        for (int h = 257; h < 321; h += 8)
        {
            raster[h + 0] += cycles.oamReadIndex + cycles.bgNameRequest;
            raster[h + 1] += cycles.oamReadIndex + cycles.bgNameResponse;
            raster[h + 2] += cycles.oamReadIndex + cycles.bgAttrRequest;
            raster[h + 3] += cycles.oamReadIndex + cycles.bgAttrResponse;
            raster[h + 4] += cycles.oamReadIndex + cycles.spBit0Request;
            raster[h + 5] += cycles.oamReadIndex + cycles.spBit0Response;
            raster[h + 6] += cycles.oamReadIndex + cycles.spBit1Request;
            raster[h + 7] += cycles.oamReadIndex + cycles.spBit1Response;
        }
    }
}
