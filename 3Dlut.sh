//-------------
//3Dlut
//-------------

//Slog3 to Rec709 Color space 
ffmpeg -i avignon.mov -vf lut3d='3dlut/1_SGamut3CineSLog3_To_LC-709.cube'  out_001.mov
//Slog3 and Rec709 side by side
ffplay -i 4300.mxf  -vf "split=2[a][b];[b]lut3d='3dlut/From_SLog2SGumut_To_LC-709_.cube'[709];[a][709]hstack=2"
