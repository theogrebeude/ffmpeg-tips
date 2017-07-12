//-------------
//analyse audio
//-------------


//wave et spectrum
ffplay -f lavfi 'amovie=ez3kiel_lux.flac,asplit=3[out1][a][b]; [a]showwaves=s=640x240[waves]; [b]showspectrum=s=640x240[spectrum]; [waves][spectrum] vstack[out0]'
//spectrum
ffplay -f lavfi 'amovie=ez3kiel_lux.flac,asplit=2[out1][a]; [a]showspectrum=color=channel:scale=cbrt:orientation=vertical:overlap=1:s=2048x1024[out0]'
ffplay -f lavfi 'amovie=ez3kiel_lux.flac,asplit=2[out1][a]; [a]showspectrum=color=fire:scale=log:orientation=vertical:overlap=1:s=1024x1024[out0]'
//vectorscope
ffplay -f lavfi 'amovie=ez3kiel_lux.flac,asplit=2[out1][a],[a]avectorscope=m=polar:s=800x400[out0]'
//cpt
ffplay -f lavfi 'amovie=ez3kiel_lux.flac,asplit=2[out1][a],[a]showcqt[out0]'
ffplay -i ez3kiel_lux.flac -f lavfi showcqt 
//spectrum to img
ffmpeg -i ez3kiel_lux.flac -lavfi showspectrumpic=s=hd720 out.jpg
ffplay -f lavfi "ez3kiel_lux.flac, asplit [a][out1]; [a] showvolume=f=255:b=4:w=720:h=68 [out0]"
ffmpeg -i ez3kiel_lux.flac -filter_complex "[0:a]showvolume=f=1:b=4:w=720:h=68,format=yuv420p[vid]" -map "[vid]" -map 0:a output.mp4
//R128 visuel
ffplay -f lavfi -i  "amovie='ez3kiel_lux.flac',ebur128=video=1:meter=18 [out0][out1]"
//R128 cli info 
ffmpeg -nostats -i 'ez3kiel_lux.flac' -filter_complex ebur128 -f null
