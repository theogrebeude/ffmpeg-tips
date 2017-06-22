// convert gif to DXCAM HD 50 Mbits/s 422 MXF with FFMPEG
// this script require gif longer than 3 frames
// 2 parameters in input 
// firt is the input gif file
// second  is the name off the output video 


ffmpeg  -i $1 -filter_complex  "color=black:size=1920x1080[base]; [0:v] scale=if(gt(iw\,ih)\,1920\,(iw/ih)*1080):if(gt(iw\,ih)\,(ih/iw)*1920\,1080) [video];[base][video] overlay=shortest=1:x=if(gt(w\,h)\,0\,(W-w)/2):y=if(gt(w\,h)\,(H-h)/2\,0) [out]" -map "[out]" -pix_fmt yuv422p -vcodec mpeg2video -flags +ildct+ilme -top 1 -b:v 50000k -minrate 50000k -maxrate 50000k -bufsize 36408333 -r 25 -s 1920x1080 -aspect 16:9 -f mxf -y $2
