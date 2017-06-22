// extract part of video with FFMPEG
// 4 parameters in input 
// firt is the input video
// second is the start time like HH:MM:SS or like MM:SS.mm
// third is the duration like the start time
// fourth is the name off the output video 

ffmpeg -i $1 -ss $2 -t $3 -c copy $4 
