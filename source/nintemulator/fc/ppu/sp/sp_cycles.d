module fc.ppu.sp.sp_cycles;


import fc.ppu.bg.scroll;
import fc.ppu.bus;
import fc.ppu.registers;
import fc.ppu.bg.cycles.bg_name_request;
import fc.ppu.bg.cycles.bg_name_response;
import fc.ppu.bg.cycles.bg_attr_request;
import fc.ppu.bg.cycles.bg_attr_response;
import fc.ppu.sp.evaluation.evaluation_cycles;
import fc.ppu.sp.oam;
import fc.ppu.sp.sp_output_unit;
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

    this(Bus bus, Registers registers, Scroll scroll, Oam oam, SpOutputUnit spOutputUnit)
    {
        bgNameRequest = new BgNameRequest(bus, scroll);
        bgNameResponse = new BgNameResponse(bus, registers);
        bgAttrRequest = new BgAttrRequest(bus, scroll);
        bgAttrResponse = new BgAttrResponse(bus, registers, scroll);
        spBit0Request = new SpBit0Request(bus, registers, oam);
        spBit0Response = new SpBit0Response(bus, registers, oam, spOutputUnit);
        spBit1Request = new SpBit1Request(bus, registers, oam);
        spBit1Response = new SpBit1Response(bus, registers, oam, spOutputUnit);
        oamReadIndex = new OamReadIndex(oam, registers);
        oamRead = new OamRead(oam);
        oamWrite = new OamWrite(oam, new EvaluationCycles(oam, registers));
        oamInitializeRead = new OamInitializeRead(oam);
        oamInitializeWrite = new OamInitializeWrite(oam);
    }
}
