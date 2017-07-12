// analyse/show the alpha channel of videofile
//
//juste alpha
ffplay -i fichier.mp4 -vf "alphaextract"
//video & alpha side by side 
ffmplay -i alpha.mov  -vf "split=2[a][b];[b]alphaextract[alpha];[a][alpha]hstack=2"
