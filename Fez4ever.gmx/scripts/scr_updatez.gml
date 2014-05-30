if (pular>0) {
    id_chao=instance_position(obj_gomez.x,obj_gomez.y,obj_block);
} else {
    atual_z=anterior_z;
    posicao_xblock=x;
    posicao_yblock=y;
    for (i=posicao_xblock; i>=0; i-=16) {
        posicao_xblock=i;
    }
    for (i=posicao_yblock; i>=0; i-=16) {
        posicao_yblock=i;
    }
    posicao_xblock=(obj_gomez.x-posicao_xblock)+8;
    posicao_yblock=(obj_gomez.y-posicao_yblock)+8;
    if (obj_camera.direcao==180) {
        for (i=640; i<=0; i-=16) {
            id_chao=instance_position(i,obj_gomez.y,obj_block);
            if (id_chao!=noone) {
                if (id_chao.z>=atual_z) and (id_chao.z<=obj_gomez.z) {
                    atual_z=id_chao.z;
                    obj_gomez.x=id_chao.x+8;
                }
            }
        }
    }
    if (obj_camera.direcao==270) {
        for (i=0; i<=480; i+=16) {
            id_chao=instance_position(obj_gomez.x,i,obj_block);
            if (id_chao!=noone) {
                if (id_chao.z>=atual_z) and (id_chao.z<=obj_gomez.z) {
                    atual_z=id_chao.z;
                    obj_gomez.y=id_chao.y+8;
                }
            }
        }
    }
    if (obj_camera.direcao==0) {
        for (i=0; i<=640; i+=16) {
            id_chao=instance_position(i,obj_gomez.y,obj_block);
            if (id_chao!=noone) {
                if (id_chao.z>=atual_z) and (id_chao.z<=obj_gomez.z) {
                    atual_z=id_chao.z;
                    obj_gomez.x=id_chao.x+8;
                }
            }

        }
    }
    if (obj_camera.direcao==90) {
        for (i=480; i>=0; i-=16) {
            id_chao=instance_position(obj_gomez.x,i,obj_block);
            if (id_chao!=noone) {
                if (id_chao.z>=atual_z) and (id_chao.z<=obj_gomez.z) {
                    atual_z=id_chao.z;
                    obj_gomez.y=id_chao.y+8;
                }
            }
        }
    }
}
