// ffmpeg script for generate thumbnails every new scene 
// one parameter $1 is the video input 


ffmpeg -i $1 -vf  "select=gt(scene\,0.2), scale=640:360" -vsync vfr apercu%03d.png

// generate image of 9 thumbnails 

ffmpeg -i $1 -vf  "select=gt(scene\,0.2), scale=640:360, tile=3x3" -vsync vfr apercu%03d.png
