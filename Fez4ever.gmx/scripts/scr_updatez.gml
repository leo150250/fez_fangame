//Código de atualização da profundidade do personagem em relação a câmera

//Aqui o pau comeu solto, com azeitonas pretas em cream cheese e picles ao molho barbecue.
//[TODO]Acho que vai ser até mais fácil tentar criar um código mais enxuto, mais prático do que tentar fazer manutenção nessa coisa.

//Se o Gomez tiver autorização pra pular, então não há por que atualizar a profundidade, pois ele já está em um chão.
//MAS, somente se no personagem estiver definido para não forçar a atualização da profundidade.
if (pular>0) and (argument0==false) {
    id_chao=instance_position(obj_gomez.x,obj_gomez.y,obj_block);
    refazer_profundidade=false;
}
//DO CONTRÁRIO, então deve-se atualizar a "posição z" dele, ora bolas!
//Vamos tentar refazer esse código pela 3ª vez... Acho que agora vai dar certo...
//Acho que agora deu certo, de maneira BEEEMM mais aprimorada!
else {
    //Inicialmente, não há "bloqueios"
    bloqueio=false;
    //Se a câmera estiver na direção 0 (Direita):
    if (obj_camera.direcao==0) {
        //A princípio, a profundidade mais funda é a que está "além do arco-íris"
        profundidade_eleita=-1;
        //Para cada bloco, verifica-se então se ele não está na frente absoluta do Gomez. Se estiver, vai bloquear a atualização de profundidade.
        with (obj_block) {
            if (y==other.posicao_yblock-8) and (z==other.posicao_zblock) and (x>other.posicao_xblock-8) {
                other.bloqueio=true;
            }
        }
        //Se realmente não estiver bloqueado, então ele fica o mais próximo possível da câmera.
        if (bloqueio==false) {
            if (refazer_profundidade==false) {
                girox=x;
                giroy=y;
                refazer_profundidade=true;
            }
            x=1024+8;
        }
        //Depois, para cada bloco, verifica-se então se...
        with (obj_block) {
            //...este bloco tem todas as qualificações para suportar o Gomez.
            if (y==other.posicao_yblock-8)
            and (x>other.profundidade_eleita) 
            //As duas funções acima estão fora do script abaixo pois elas alteram de acordo com a direção da câmera, enquanto as que estão dentro do script sempre serão checadas.
            and (scr_checkplat(self)==true) {
                other.profundidade_eleita=x;
            }
        }
        //Se realmente não estava bloqueado, e houve uma profundidade digna de suportar o Gomez, move ele então para lá.
        if (bloqueio==false) and (profundidade_eleita>-1) {
            x=profundidade_eleita+8;
        }
    }
    //A mesma coisa acima se repete na direção 90, 180 e 270:
    if (obj_camera.direcao==90) {
        profundidade_eleita=1025;
        with (obj_block) {
            if (x==other.posicao_xblock-8) and (z==other.posicao_zblock) and (y<other.posicao_yblock-8) {
                other.bloqueio=true;
            }
        }
        if (bloqueio==false) {
            if (refazer_profundidade==false) {
                girox=x;
                giroy=y;
                refazer_profundidade=true;
            }
            y=0+8;
        }
        with (obj_block) {
            if (x==other.posicao_xblock-8)
            and (y<other.profundidade_eleita) 
            and (scr_checkplat(self)==true) {
                other.profundidade_eleita=y;
            }
        }
        if (bloqueio==false) and (profundidade_eleita<1025) {
            y=profundidade_eleita+8;
        }
    }
    if (obj_camera.direcao==180) {
        profundidade_eleita=1025;
        with (obj_block) {
            if (y==other.posicao_yblock-8) and (z==other.posicao_zblock) and (x<other.posicao_xblock-8) {
                other.bloqueio=true;
            }
        }
        if (bloqueio==false) {
            if (refazer_profundidade==false) {
                girox=x;
                giroy=y;
                refazer_profundidade=true;
            }
            x=0+8;
        }
        with (obj_block) {
            if (y==other.posicao_yblock-8)
            and (x<other.profundidade_eleita) 
            and (scr_checkplat(self)==true) {
                other.profundidade_eleita=x;
            }
        }
        if (bloqueio==false) and (profundidade_eleita<1025) {
            x=profundidade_eleita+8;
        }
    }
    if (obj_camera.direcao==270) {
        profundidade_eleita=-1;
        with (obj_block) {
            if (x==other.posicao_xblock-8) and (z==other.posicao_zblock) and (y>other.posicao_yblock-8) {
                other.bloqueio=true;
            }
        }
        if (bloqueio==false) {
            if (refazer_profundidade==false) {
                girox=x;
                giroy=y;
                refazer_profundidade=true;
            }
            y=1024+8;
        }
        with (obj_block) {
            if (x==other.posicao_xblock-8)
            and (y>other.profundidade_eleita) 
            and (scr_checkplat(self)==true) {
                other.profundidade_eleita=y;
            }
        }
        if (bloqueio==false) and (profundidade_eleita>-1) {
            y=profundidade_eleita+8;
        }
    }
}
/*
Código antigo devorador de programadores. Antes, somente eu e Deus sabia o que isso acontecia. Agora, só Deus mesmo...
Deixa aqui porque... Vai que... né!?
else {
    //A profundidade será atualizada!
    atualizar_profundidade=false;
    //Grava o atual_z com o valor do anterior_z;
    //Eu acho que isso tá invertido...
    //Realmente, está invertido, mas a atualização da posição ta bugando quando desinverto-o, fazendo o Gomez cair mesmo se há chão embaixo dele.
    //Preciso estudar melhor o que raios aconteceu aqui...
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
        for (i=1024; i>=0; i-=16) {
            with (obj_block) {
                if (y==other.posicao_yblock-8) and (z==other.posicao_zblock-8) and (x>other.posicao_xblock-8) {
                    other.bloqueio=true;
                }
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
        profundidade_minima=1024;
        bloqueio=false;
        for (i=0; i<=1024; i+=16) {
            with (obj_block) {
                if (x==other.posicao_xblock-8) and (z==other.posicao_zblock-8) and (y<other.posicao_yblock-8) {
                    other.bloqueio=true;
                }
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
        profundidade_minima=1024;
        bloqueio=false;
        for (i=0; i<=1024; i+=16) {
            with (obj_block) {
                if (y==other.posicao_yblock-8) and (z==other.posicao_zblock-8) and (x<other.posicao_xblock-8) {
                    other.bloqueio=true;
                }
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
        for (i=1024; i>=0; i-=16) {
            with (obj_block) {
                if (x==other.posicao_xblock-8) and (z==other.posicao_zblock-8) and (y>other.posicao_yblock-8) {
                    other.bloqueio=true;
                }
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
}*/
