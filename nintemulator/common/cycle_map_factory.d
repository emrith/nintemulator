module common.cycle_map_factory;


import common.cycle;


interface CycleMapFactory(int x, int y)
{
    Cycle[x][y] createMap();
}
