module common.video.null_video_output;


import common.video.video_output;
import common.video.video_channel;
import common.video.null_video_channel;


class NullVideoOutput : VideoOutput
{
    public VideoChannel getChannel(int index)
    {
        return new NullVideoChannel();
    }
}
