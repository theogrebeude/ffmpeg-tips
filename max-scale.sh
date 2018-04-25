// convert image to JPG with scale limitation 2500x2500 
// 2 parameters in input 
// first is the input video
// second  is the name off the output video 

ffmpeg -i $1 -q:v 1 -filter_complex "scale='if(gte(iw\,ih),if(gte(iw\,2500),2500\,iw),if(gte(ih\,2500),iw*2500/ih\,iw))':'if(gte(iw\,ih),if(gte(iw\,2500),ih*2550/iw\,ih),if(gte(ih\,2500),2500\,ih))'" -y $2
