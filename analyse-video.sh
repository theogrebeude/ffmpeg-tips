//-------------
//analyse video
//-------------
//split couleur RGB 
ffplay  -i fichier.mp4 -vf "split=4[a][b][c][d];[b]lutrgb=g=0:b=0[x];[c]lutrgb=r=0:b=0[y];[d]lutrgb=r=0:g=0[z];[a][x][y][z]hstack=4"
//histograme et waveform
ffplay  -i fichier.mp4 -vf "format=gbrp,split=4[a][b][c][d],[d]histogram=display_mode=0:level_height=244[dd],[a]waveform=m=1:d=0:r=0:c=7[aa],[b]waveform=m=0:d=0:r=0:c=7[bb],[c][aa]vstack[V],[bb][dd]vstack[V2],[V][V2]hstack"
//vectorscope et waveform
ffplay  -i fichier.mp4  -vf "format=yuv444p,split=4[a][b][c][d],[a]waveform[aa],[b][aa]vstack[V],[c]waveform=m=0[cc],[d]vectorscope=color4[dd],[cc][dd]vstack[V2],[V][V2]hstack" vector.mp4
//waveform
ffplay  -i fichier.mp4 -vf "split[a][b];[a]format=gray,waveform,split[c][d];[b]pad=iw:ih+256[padded];[c]geq=g=1:b=1[red];[d]geq=r=1:b=1,crop=in_w:220:0:16[mid];[red][mid]overlay=0:16[wave];[padded][wave]overlay=0:H-h"
//waveform avec envelope
ffplay  -i fichier.mp4 -vf "split[a][b];[a]waveform=e=3,split=3[c][d][e];[e]crop=in_w:20:0:235,lutyuv=v=180[low];[c]crop=in_w:16:0:0,lutyuv=y=val:v=180[high];[d]crop=in_w:220:0:16,lutyuv=v=110[mid] ; [b][high][mid][low]vstack=4"
//YCBCR parade
ffplay  -i fichier.mp4 -vf waveform=filter=lowpass:scale=ire:graticule=green:flags=numbers+dots:components=7:display=parade
//RGB parade
ffplay  -i fichier.mp4 -vf format=gbrp,waveform=filter=lowpass:components=7:display=parade
//RGB overlay
ffplay  -i fichier.mp4o -vf format=gbrp,waveform=filter=lowpass:components=7:display=overlay
//waveform on top
ffplay  -i fichier.mp4  -vf "split=2[a][b],[b]waveform=g=green:s=ire:fl=15:i=.1:f=chroma:bgopacity=.5,format=yuva444p[bb],[a][bb]overlay"
ffplay  -i fichier.mp4 -vf "format=yuva444p9,split=2[m][v],[v]vectorscope=b=0.7:m=color3:g=green[v],[m][v]overlay=x=W-w:y=H-h"
