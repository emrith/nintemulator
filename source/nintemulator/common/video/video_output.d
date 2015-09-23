module common.video.video_output;


import common.video.video_channel;


interface VideoOutput
{
    VideoChannel getChannel(int index);
}
