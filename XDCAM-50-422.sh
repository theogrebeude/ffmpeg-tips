// convert video to DXCAM HD 50 Mbits/s 422 MXF with FFMPEG
// 2 parameters in input 
// firt is the input video
// second  is the name off the output video 

ffmpeg  -i $1  -pix_fmt yuv422p -vcodec mpeg2video -flags +ildct+ilme -top 1 -b:v 50000k -minrate 50000k -maxrate 50000k -bufsize 36408333 -r 25 -s 1920x1080 -aspect 16:9 -acodec pcm_s24le -ar 48000 -f mxf -y $2
