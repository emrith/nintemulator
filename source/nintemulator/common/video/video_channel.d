module common.video.video_channel;


interface VideoChannel
{
    void sample(int time, int output);
}
