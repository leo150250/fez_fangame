//Código de atualização da profundidade do personagem em relação a câmera

//Aqui o pau comeu solto, com azeitonas pretas em cream cheese e picles ao molho barbecue.

//Se o Gomez tiver autorização pra pular, então não há por que atualizar a profundidade, pois ele já está em um chão.
//MAS, somente se no personagem estiver definido para não forçar a atualização da profundidade.
if (pular>0) and (argument0==false) {
    id_chao=instance_position(obj_gomez.x,obj_gomez.y,obj_block);
}
//DO CONTRÁRIO, então deve-se atualizar a "posição z" dele, ora bolas!
else {
    //A profundidade será atualizada!
    atualizar_profundidade=false;
    //Grava o atual_z com o valor do anterior_z;
    //Eu acho que isso tá invertido...
    atual_z=anterior_z;
    //Agora, conforme a direção da câmera, as funções abaixo fazem o seguinte:
    //Pega-se a posição que o gomez está e vai testando profundidade por profundidade (de 16 em 16),
    //E assim que ele encontra um id_chao, então ele testa pra ver se o personagem está mais alto que o bloco
    //e que a altura desse bloco é maior ou igual que a altura dele. Isso é para que o bloco que seja "eleito"
    //o principal da profundidade que o Gomez está seja simplesmente o bloco mais alto, abaixo do Gomez.
    //Isso deve ser feito para que essa função, a cada vez que ela for executada, não fique alternando entre vários blocos
    //de diferentes alturas.
    //Essa atribuição se faz alterando a posição x ou y do obj_gomez para ficar na profundidade certa do bloco que realmente
    //está abaixo dele, na visão ortogonal.
    if (obj_camera.direcao==0) {
        profundidade_minima=0;
        bloqueio=false;
        for (i=640; i>=0; i-=16) {
            with (obj_block) {
                if (y==other.posicao_yblock-8) and (x==other.i) {
                    if (z==other.posicao_zblock-24)
                    and (lado_topo>-1)
                    and (other.bloqueio==false) {
                        if (z>=other.atual_z)
                        and (other.profundidade_minima<x) {
                            other.atual_z=z;
                            obj_gomez.x=(x+8);
                            other.profundidade_minima=x;
                        }
                    }
                    else if (z==other.posicao_zblock-8) {
                        other.bloqueio=true;
                    }
                }
            }
        }
    }
    if (obj_camera.direcao==90) {
        profundidade_minima=480;
        bloqueio=false;
        for (i=0; i<=480; i+=16) {
            with (obj_block) {
                if (x==other.posicao_xblock-8) and (y==other.i) {
                    if (z==other.posicao_zblock-24)
                    and (lado_topo>-1)
                    and (other.bloqueio==false) {
                        if (z>=other.atual_z)
                        and (other.profundidade_minima>y) {
                            other.atual_z=z;
                            obj_gomez.y=(y+8);
                            other.profundidade_minima=y;
                        }
                    }
                    else if (z==other.posicao_zblock-8) {
                        other.bloqueio=true;
                    }
                }
            }
        }
    }
    if (obj_camera.direcao==180) {
        profundidade_minima=640;
        bloqueio=false;
        for (i=0; i<=640; i+=16) {
            with (obj_block) {
                if (y==other.posicao_yblock-8) and (x==other.i) {
                    if (z==other.posicao_zblock-24)
                    and (lado_topo>-1)
                    and (other.bloqueio==false) {
                        if (z>=other.atual_z)
                        and (other.profundidade_minima>x) {
                            other.atual_z=z;
                            obj_gomez.x=(x+8);
                            other.profundidade_minima=x;
                        }
                    }
                    else if (z==other.posicao_zblock-8) {
                        other.bloqueio=true;
                    }
                }
            }
        }
    }
    if (obj_camera.direcao==270) {
        profundidade_minima=0;
        bloqueio=false;
        for (i=480; i>=0; i-=16) {
            with (obj_block) {
                if (x==other.posicao_xblock-8) and (y==other.i) {
                    if (z==other.posicao_zblock-24)
                    and (lado_topo>-1)
                    and (other.bloqueio==false) {
                        if (z>=other.atual_z)
                        and (other.profundidade_minima<y) {
                            other.atual_z=z;
                            obj_gomez.y=(y+8);
                            other.profundidade_minima=y;
                        }
                    }
                    else if (z==other.posicao_zblock-8) {
                        other.bloqueio=true;
                    }
                }
            }
        }
    }
}
