//Script de checagem se o bloco abrange todas as exigências para ser uma plataforma pro Gomez.
//Sabe como é... Ele é exigente...
//Primeiro, verifica se a altura dele está dentro de uma posição block aceitável para o Gomez:
if (argument0.z<=obj_gomez.posicao_zblock-16) 
and (argument0.z>=obj_gomez.posicao_zblock-24)
//Depois, verifica se a altura dele está condizente com a posição absoluta do Gomez, até mesmo para onde ele está indo:
and (argument0.z<=obj_gomez.z-15)
and (argument0.z>=obj_gomez.z-16+obj_gomez.zspeed)
//Mais ainda, verifica se o Gomez não está sendo bloqueado
and (obj_gomez.bloqueio==false)
//E ainda, verifica se o Gomez está caindo
and (obj_gomez.zspeed<0) {
    //Se tudo acima for verdade, ainda tem que verificar se esse bloco possui "chão". Se não tiver, então é dado o comando para bloquear a atualização, mesmo sendo verdade.
    if (argument0.lado_topo==-1) {
        obj_gomez.bloqueio=true;
    }
    return true;
} else {
    return false;
}
//Se tudo isso for verdade, então este bloco é digno de servir de suporte à real majestade, magnífica das 3 dimensões, o sr. Gomez. *trombetas triunfantes tocando*
