module fc.ppu.sp.obj_cycle_mapper;


import common.cycle;
import common.cycle_mapper;
import common.sequence;
import fc.ppu.sp.oam;
import fc.ppu.sp.obj_cycles;


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
        foreach (v; Sequence.range(0, 240))
        {
            mapToRaster(array[v]);
        }

        mapToRaster(array[261]);
    }

    private void mapToRaster(Cycle[] raster)
    {
        foreach (h; Sequence.range(1, 65, 2))
        {
            raster[h + 0] += cycles.oamInitializeRead;
            raster[h + 1] += cycles.oamInitializeWrite;
        }

        foreach (h; Sequence.range(65, 257, 2))
        {
            raster[h + 0] += cycles.oamRead;
            raster[h + 1] += cycles.oamWrite;
        }

        foreach (h; Sequence.range(257, 321, 8))
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
