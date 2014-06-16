obj_gomez.cubeshard+=1;
switch (obj_gomez.som_cubeshard) {
    case 1: audio_play_sound(snd_assemble_c_maj,1,false); break;
    case 2: audio_play_sound(snd_assemble_csharp_maj,1,false); break;
    case 3: audio_play_sound(snd_assemble_d_maj,1,false); break;
    case 4: audio_play_sound(snd_assemble_dsharp_maj,1,false); break;
    case 5: audio_play_sound(snd_assemble_e_maj,1,false); break;
    case 6: audio_play_sound(snd_assemble_f_maj,1,false); break;
    case 7: audio_play_sound(snd_assemble_fsharp_maj,1,false); break;
    case 8: audio_play_sound(snd_assemble_g_maj,1,false); break;
    case 9: audio_play_sound(snd_assemble_gsharp_maj,1,false); break;
    case 10: audio_play_sound(snd_assemble_a_maj,1,false); break;
    case 11: audio_play_sound(snd_assemble_asharp_maj,1,false); break;
    case 12: audio_play_sound(snd_assemble_b_maj,1,false); break;
    case 13: audio_play_sound(snd_assemble_c3_maj,1,false); break;
}
obj_gomez.som_cubeshard+=1;
if (obj_gomez.som_cubeshard>13) {
    obj_gomez.som_cubeshard=1;
}
with (obj_gomez) {
    timeline_index=tl_cubeshard;
    timeline_position=0;
    timeline_running=true;
}
