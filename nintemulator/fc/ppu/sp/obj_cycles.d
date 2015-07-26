module fc.ppu.sp.sp_cycles;


import fc.ppu.bg.cycles.bg_name_request;
import fc.ppu.bg.cycles.bg_name_response;
import fc.ppu.bg.cycles.bg_attr_request;
import fc.ppu.bg.cycles.bg_attr_response;
import fc.ppu.sp.cycles.sp_bit0_request;
import fc.ppu.sp.cycles.sp_bit0_response;
import fc.ppu.sp.cycles.sp_bit1_request;
import fc.ppu.sp.cycles.sp_bit1_response;
import fc.ppu.sp.cycles.oam_read_index;
import fc.ppu.sp.cycles.oam_initialize_read;
import fc.ppu.sp.cycles.oam_initialize_write;
import fc.ppu.sp.cycles.oam_read;
import fc.ppu.sp.cycles.oam_write;


class SpCycles
{
    public BgNameRequest bgNameRequest;
    public BgNameResponse bgNameResponse;
    public BgAttrRequest bgAttrRequest;
    public BgAttrResponse bgAttrResponse;
    public SpBit0Request spBit0Request;
    public SpBit0Response spBit0Response;
    public SpBit1Request spBit1Request;
    public SpBit1Response spBit1Response;
	public OamReadIndex oamReadIndex;
    public OamRead oamRead;
    public OamWrite oamWrite;
    public OamInitializeRead oamInitializeRead;
    public OamInitializeWrite oamInitializeWrite;
}
