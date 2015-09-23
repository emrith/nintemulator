module fc.ppu.cycles.output_cycle;


import common.cycle;
import common.video.video_output;
import fc.ppu.registers;
import fc.ppu.output_unit;


class OutputCycle : Cycle
{
    private Registers registers;
    private OutputUnit outputUnit;
    private VideoOutput videoOutput;

    this(Registers registers, OutputUnit outputUnit, VideoOutput videoOutput)
    {
        this.registers = registers;
        this.outputUnit = outputUnit;
        this.videoOutput = videoOutput;
    }

    public override void execute()
    {
        auto channel = videoOutput.getChannel(registers.v);
        auto output = outputUnit.getOutputColor();

        channel.sample(registers.h, output);
    }
}
