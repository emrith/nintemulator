module fc.ppu.bg.bg_cycles;


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


class BgCycles
{
    public BgNameRequest bgNameRequest;
    public BgNameResponse bgNameResponse;
    public BgAttrRequest bgAttrRequest;
    public BgAttrResponse bgAttrResponse;
    public BgBit0Request bgBit0Request;
    public BgBit0Response bgBit0Response;
    public BgBit1Request bgBit1Request;
    public BgBit1Response bgBit1Response;
    public ClockScrollX clockScrollX;
    public ClockScrollY clockScrollY;
    public ResetScrollX resetScrollX;
    public ResetScrollY resetScrollY;
}
