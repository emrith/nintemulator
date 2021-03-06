﻿module fc.ppu.bg.bg_cycle_mapper;


import common.cycle;
import common.cycle_mapper;
import common.sequence;
import fc.ppu.bg.bg_cycles;


class BgCycleMapper : CycleMapper!(341, 262)
{
    private BgCycles cycles;

    this(BgCycles cycles)
    {
        this.cycles = cycles;
    }

    public override void mapTo(Cycle[341][262] array)
    {
        for (int v = 0; v < 240; v++)
        {
            mapToRaster(array[v]);
        }

        mapToRaster(array[261]);

        for (int h = 280; h <= 304; h++)
        {
            array[261][h] += cycles.resetScrollY;
        }
    }

    private void mapToRaster(Cycle[341] raster)
    {
        foreach (h; Sequence.range(1, 257, 8))
        {
            raster[h + 0] += cycles.bgNameRequest;
            raster[h + 1] += cycles.bgNameResponse;
            raster[h + 2] += cycles.bgAttrRequest;
            raster[h + 3] += cycles.bgAttrResponse;
            raster[h + 4] += cycles.bgBit0Request;
            raster[h + 5] += cycles.bgBit0Response;
            raster[h + 6] += cycles.bgBit1Request;
            raster[h + 7] += cycles.bgBit1Response;
        }

        foreach (h; Sequence.range(321, 337, 8))
        {
            raster[h + 0] += cycles.bgNameRequest;
            raster[h + 1] += cycles.bgNameResponse;
            raster[h + 2] += cycles.bgAttrRequest;
            raster[h + 3] += cycles.bgAttrResponse;
            raster[h + 4] += cycles.bgBit0Request;
            raster[h + 5] += cycles.bgBit0Response;
            raster[h + 6] += cycles.bgBit1Request;
            raster[h + 7] += cycles.bgBit1Response;
        }

        foreach (h; Sequence.range(337, 341, 2))
        {
            raster[h + 0] += cycles.bgNameRequest;
            raster[h + 1] += cycles.bgNameResponse;
        }

        foreach (h; Sequence.range(8, 249, 8))
        {
            raster[h] += cycles.clockScrollX;
        }

        foreach (h; Sequence.range(328, 336, 8))
        {
            raster[h] += cycles.clockScrollX;
        }

        raster[256] += cycles.clockScrollY;
        raster[257] += cycles.resetScrollX;
    }
}
