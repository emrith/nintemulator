module common.video.null_video_channel;


import common.video.video_channel;


class NullVideoChannel : VideoChannel
{
    public void sample(int time, int output)
    {
    }
}
