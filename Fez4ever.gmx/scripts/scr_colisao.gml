id_chao=instance_position(x,y,obj_block);
id_chao1=instance_position(x-6,y-6,obj_block);
id_chao2=instance_position(x+6,y+6,obj_block);
if (id_chao1==noone) and (id_chao2==noone) {
    zspeed-=0.2;
    pular-=1;
    scr_updatez();
} else {
    if (id_chao1!=noone) {
        if ((z>id_chao1.z+8) and (z<id_chao1.z+16) and (zspeed<0)) {
            zspeed=0;
            z=id_chao1.z+16;
            pular=2;
        } else {
            if (id_chao2!=noone) {
                if ((z>id_chao2.z+8) and (z<id_chao2.z+16) and (zspeed<0)) {
                    zspeed=0;
                    z=id_chao2.z+16;
                    pular=2;
                } else {
                    zspeed-=0.2;
                    pular-=1;
                    scr_updatez();
                }
            } else {
                zspeed-=0.2;
                pular-=1;
                scr_updatez();
            }
        }
    } else {
        if (id_chao2!=noone) {
            if ((z>id_chao2.z+8) and (z<id_chao2.z+16) and (zspeed<0)) {
                zspeed=0;
                z=id_chao2.z+16;
                pular=2;
            } else {
                zspeed-=0.2;
                pular-=1;
                scr_updatez();
            }
        } else {
            zspeed-=0.2;
            pular-=1;
            scr_updatez();
        }
    }
}
