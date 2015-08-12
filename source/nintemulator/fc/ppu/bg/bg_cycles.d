module fc.ppu.bg.bg_cycles;


import common.cycle;

import fc.ppu.bg.cycles.bg_name_request;
import fc.ppu.bg.cycles.bg_name_response;
import fc.ppu.bg.cycles.bg_attr_request;
import fc.ppu.bg.cycles.bg_attr_response;
import fc.ppu.bg.cycles.bg_bit0_request;
import fc.ppu.bg.cycles.bg_bit0_response;
import fc.ppu.bg.cycles.bg_bit1_request;
import fc.ppu.bg.cycles.bg_bit1_response;
import fc.ppu.bg.cycles.clock_scroll_x;
import fc.ppu.bg.cycles.clock_scroll_y;
import fc.ppu.bg.cycles.reset_scroll_x;
import fc.ppu.bg.cycles.reset_scroll_y;

import fc.ppu.bg.scroll;
import fc.ppu.bus;
import fc.ppu.registers;


class BgCycles
{
    public Cycle bgNameRequest;
    public Cycle bgNameResponse;
    public Cycle bgAttrRequest;
    public Cycle bgAttrResponse;
    public Cycle bgBit0Request;
    public Cycle bgBit0Response;
    public Cycle bgBit1Request;
    public Cycle bgBit1Response;
    public Cycle clockScrollX;
    public Cycle clockScrollY;
    public Cycle resetScrollX;
    public Cycle resetScrollY;

    this(Bus bus, Registers registers, Scroll scroll)
    {
        this.bgNameRequest = new BgNameRequest(bus, scroll);
        this.bgNameResponse = new BgNameResponse(bus, registers);
        this.bgAttrRequest = new BgAttrRequest(bus, scroll);
        this.bgAttrResponse = new BgAttrResponse(bus, registers, scroll);
        this.bgBit0Request = new BgBit0Request(bus, registers, scroll);
        this.bgBit0Response = new BgBit0Response(bus, registers);
        this.bgBit1Request = new BgBit1Request(bus, registers, scroll);
        this.bgBit1Response = new BgBit1Response(bus, registers);
        this.clockScrollX = new ClockScrollX(scroll);
        this.clockScrollY = new ClockScrollY(scroll);
        this.resetScrollX = new ResetScrollX(scroll);
        this.resetScrollY = new ResetScrollY(scroll);
    }
}
