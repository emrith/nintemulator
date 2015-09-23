module common.cycle_mapper;


import common.cycle;


interface CycleMapper(int x, int y)
{
    void mapTo(Cycle[x][y] array);
}
