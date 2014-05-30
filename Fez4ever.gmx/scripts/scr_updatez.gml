//Código de atualização da profundidade do personagem em relação a câmera

//Aqui o pau comeu solto, com creme de chantilly e picles.

//Se o Gomez tiver autorização pra pular, então não há por que atualizar a profunidade, pois ele já está em um chão.
//(Eu achei isso uma furada, se alguém tiver uma ideia melhor de como fazer isso... Agradeço!)
if (pular>0) {
    id_chao=instance_position(obj_gomez.x,obj_gomez.y,obj_block);
}
//DO CONTRÁRIO, então deve-se atualizar a posição z dele, ora bolas!
else {
    //Grava o atual_z com o valor do anterior_z;
    //Eu acho que isso tá invertido...
    atual_z=anterior_z;
    //Obtém a posição atual do jogador...
    posicao_xblock=x;
    posicao_yblock=y;
    //E calcula a posição atual para que ela seja reduzida a um valor entre -8 e 8.
    for (i=posicao_xblock; i>=0; i-=16) {
        posicao_xblock=i;
    }
    for (i=posicao_yblock; i>=0; i-=16) {
        posicao_yblock=i;
    }
    //Quando isso acontecer, então a posição_block irá obter um cálculo da diferença entre o obj_gomez e a variável,
    //e acrescentará 8.
    //Isso fará com que o posicao_xblock/yblock pegue as coordenadas do bloco que está no meio de onde o jogador está.
    //É bem útil para obter dados precisos de colisão.
    posicao_xblock=(obj_gomez.x-posicao_xblock)+8;
    posicao_yblock=(obj_gomez.y-posicao_yblock)+8;
    //Agora, conforme a direção da câmera, as funções abaixo fazem o seguinte:
    //Pega-se a posição que o gomez está e vai testando profundidade por profundidade (de 16 em 16),
    //E assim que ele encontra um id_chao, então ele testa pra ver se o personagem está mais alto que o bloco
    //e que a altura desse bloco é maior ou igual que a altura dele. Isso é para que o bloco que seja "eleito"
    //o principal da profundidade que o Gomez está seja simplesmente o bloco mais alto, abaixo do Gomez.
    //Isso deve ser feito para que essa função, a cada vez que ela for executada, não fique alternando entre vários blocos
    //de diferentes alturas.
    //Essa atribuição se faz alterando a posição x ou y do obj_gomez para ficar na profundidade certa do bloco que realmente
    //está abaixo dele, na visão ortogonal.
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
