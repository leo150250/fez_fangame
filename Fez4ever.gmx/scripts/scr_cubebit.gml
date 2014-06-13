obj_gomez.cubebit+=1;
if (obj_camera.direcao==0) { cubebit_offset_x=obj_camera_look.y-obj_gomez.y; }
if (obj_camera.direcao==90) { cubebit_offset_x=obj_gomez.x-obj_camera_look.x; }
if (obj_camera.direcao==180) { cubebit_offset_x=obj_gomez.y-obj_camera_look.y; }
if (obj_camera.direcao==270) { cubebit_offset_x=obj_gomez.x-obj_camera_look.x; }
cubebit_offset_y=obj_camera_look.z-obj_gomez.z;
instance_create(view_wview[0]/2+(cubebit_offset_x*3),view_hview[0]/2+(cubebit_offset_y*3),obj_hud_cubebit);
switch (obj_gomez.som_cubebit) {
    case 1: audio_play_sound(snd_c2,1,false); break;
    case 2: audio_play_sound(snd_csharp2,1,false); break;
    case 3: audio_play_sound(snd_d2,1,false); break;
    case 4: audio_play_sound(snd_dsharp2,1,false); break;
    case 5: audio_play_sound(snd_e2,1,false); break;
    case 6: audio_play_sound(snd_f2,1,false); break;
    case 7: audio_play_sound(snd_fsharp2,1,false); break;
    case 8: audio_play_sound(snd_g2,1,false); break;
    case 9: audio_play_sound(snd_gsharp2,1,false); break;
    case 10: audio_play_sound(snd_a2,1,false); break;
    case 11: audio_play_sound(snd_asharp2,1,false); break;
    case 12: audio_play_sound(snd_b2,1,false); break;
    case 13: audio_play_sound(snd_c3,1,false); break;
    case 14: audio_play_sound(snd_csharp3,1,false); break;
    case 15: audio_play_sound(snd_d3,1,false); break;
    case 16: audio_play_sound(snd_dsharp3,1,false); break;
    case 17: audio_play_sound(snd_e3,1,false); break;
    case 18: audio_play_sound(snd_f3,1,false); break;
    case 19: audio_play_sound(snd_fsharp3,1,false); break;
    case 20: audio_play_sound(snd_g3,1,false); break;
    case 21: audio_play_sound(snd_gsharp3,1,false); break;
    case 22: audio_play_sound(snd_a3,1,false); break;
    case 23: audio_play_sound(snd_asharp3,1,false); break;
    case 24: audio_play_sound(snd_b3,1,false); break;
    case 25: audio_play_sound(snd_c4,1,false); break;
}
obj_gomez.som_cubebit+=1;
if (obj_gomez.som_cubebit>25) {
    obj_gomez.som_cubebit=1;
}
obj_camera.target_hud=1;
obj_camera.alarm[1]=240;
instance_destroy();
