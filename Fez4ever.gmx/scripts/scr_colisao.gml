//Script de colisão do obj_gomez.
//Agora aqui o pau comeu solto.

//Pega as IDs dos obj_block que estão embaixo do obj_gomez
//Apesar desse primeiro não ser utilizado, é bom deixar aqui... Vai que... né...?
//Esses dois aqui são a área de abrangência do obj_gomez.
//DE CARA, se não pegar nenhuma ID, então significa que o personagem está em queda livre.
//Seta a variável zspeed para -0.2 relativos, e negativeia o pulo dele, pra ele não pular no ar.
//E, claro, atualiza a profundidade do personagem. Vai que o "chão" está em outra profundidade? Não queremos
//que o Gomez atravesse o chão sem mais nem menos, né?
//Acabei de ver que esse código é o CAOS em formato de código onde, em uma fase grande, vai dar uma sobrecarga de processamento gigante.
//[TODO]Preciso estudar uma maneira mais fácil e mais prática de fazer esse código sem fazer ele passar por TODOS os blocos da fase,
//até mesmo aqueles que NÃO ESTÃO em colisão com o Gomez.
chao_ok=false;
with (obj_block) {
    if (x==other.posicao_xblock-8) and (y==other.posicao_yblock-8) {
        if (lado_topo>-1) {
            //if (other.z<=z+16)
            //and (other.pular>=0) {
            //    other.z=z+16;
            //}
            if (other.z<=z+16)
            and (other.z>=z+15+other.zspeed) {
                other.zspeed=0;
                other.z=z+16;
                other.pular=2;
                other.chao_ok=true;
                other.id_chao=id;
                other.refazer_profundidade=false;
                other.girox=other.x;
                other.giroy=other.y;
            }
        }
    }
}
if (chao_ok==false) {
    scr_updatez(true);
    zspeed-=0.2;
    pular-=1;
}
/*Código antigo
if (id_chao1==noone) and (id_chao2==noone) {
    zspeed-=0.2;
    pular-=1;
    scr_updatez(false);
}
//Mas, e se ele encontrar um chão?
//Se encontrá-lo no id_chao1, aí ele verifica se a altura que o Gomez está é a altura da superfície do chão.
//Se for, ele vai parar em cima do bloco então.
//Senão, verifica então se encontrou um chão no id_chao2. Se encontrou, faz a mesma coisa... Do contrário,
//fica então em queda livre, pois não encontrou em nenhum id_chao um sinalzinho de chão onde ele está (chão!)
//O chão então, se não foi encontrado, então o chão 2 deve ser o chão que será detectado como chão. Se esse chão
//não for chão, não haverá chão. Esse chão, viu?
//Chão. Chão chão, chão. Chão chão chão chão VAI! VAI! VAI! VAI! TCHANANAAA NANANAAAAAAAAAAAAA
else {
    if (id_chao1!=noone) {
        if ((z>=id_chao1.z+(15+zspeed)) and (z<id_chao1.z+16) and (zspeed<0)) {
            zspeed=0;
            z=id_chao1.z+16;
            pular=2;
        } else {
            if (id_chao2!=noone) {
                if ((z>=id_chao2.z+(15+zspeed)) and (z<id_chao2.z+16) and (zspeed<0)) {
                    zspeed=0;
                    z=id_chao2.z+16;
                    pular=2;
                } else {
                    zspeed-=0.2;
                    pular-=1;
                    scr_updatez(false);
                }
            } else {
                zspeed-=0.2;
                pular-=1;
                scr_updatez(false);
            }
        }
    } else {
        if (id_chao2!=noone) {
            if ((z>=id_chao2.z+(15+zspeed)) and (z<id_chao2.z+16) and (zspeed<0)) {
                zspeed=0;
                z=id_chao2.z+16;
                pular=2;
            } else {
                zspeed-=0.2;
                pular-=1;
                scr_updatez(false);
            }
        } else {
            zspeed-=0.2;
            pular-=1;
            scr_updatez(false);
        }
    }
}*/
