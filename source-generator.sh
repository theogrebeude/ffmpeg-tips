//----------------
//source generator
//----------------
//test bar
ffmpeg -f lavfi -i testsrc=duration=10:size=1280x720:rate=300 testsrc.mp4
//mire SMPTE
ffmpeg -f lavfi -i smptebars=duration=10:size=640x360:rate=30 smptebars.mp4
//color
ffmpeg -f lavfi -i color=c=red@0.2:duration=5:s=qcif:r=10 colorsrc.mp4
//bandes RGB
ffmpeg -f lavfi -i rgbtestsrc -pix_fmt yuv420p -t 5 rgbtestsrc.mp4
