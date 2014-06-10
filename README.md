Fez (Fan-game)
==============

Um pequeno fan-game do Fez, criado por Phil Fish, usando o GameMaker: Studio para recriar o universo do jogo.

A versão utilizada para o desenvolvimento está sendo o GameMaker: Studio Professional Early Access 1.99.

Todas as sprites foram ripadas do jogo original, mas só utilizei o Google pra isso. E o código foi desenvolvido do zero, sem códigos adicionais... E é melhor que continue assim!

Lista de afazeres:
* Precisamos de todas as sprites do Gomez e dos blocos do jogo original!
* O jogo não possui som nenhum ainda. PRECISAMOS DE SOM! (Tá, tem umzinho, mas nem é do jogo original. :( )

Diário de Bordo
===============

9 de Junho de 2014
------------------
 
Após um looongo descanso, eu voltei à ativa com o desenvolvimento do Fez4ever. Comecei melhorando algumas questões gráficas, como por exemplo, colocando água nas fases. O personagem ainda atravessa a água, mas já é uma grande melhoria, principalmente por se tratar de algo que deve ocupar a fase inteira.

Ainda na questão de melhorias gráficas, alterei a resolução nativa do game (antes era 1360x768, agora é 1920x1080), pois notei que, em computadores com uma resolução nativa maior fica deveras FEIO, com tudo pixelizado demais, além da escala ficar terrível. Não sei que impacto isso terá em monitores menores, mas qualquer coisa, alguém me avisa que ficou uma porcaria! :)

No editor, os arquivos das fases tiveram de ser atualizados, para poderem obter a informação da textura que é utilizada neles. Isso é para planos futuros, visando que ainda não dá para trocar a textura dos blocos no editor. EM COMPENSAÇÃO, o editor agora tem um “mini-preview”, mostrando como que a fase está na direção que está se editando. Isso ajuda muito caso queira fazer várias plataformas em diferentes profundidades (vide imagem).

Ah, a questão do desempenho da vez passada, que fez as fases criadas no editor ficarem BEM lentas era simplesmente os frames por segundo da room que obtia o arquivo externo de fases, que estavam em 30 e não 60, dando a impressão de que o jogo estava lento. Heh!

Foram detectados mais alguns bugs bizarros, como por exemplo, na visão de direção 0, o personagem não detecta o chão a partir do ponto 0 da fase (extrema direita), acabando, por assim dizer, “voar sobre as águas”... Não sei como isso aconteceu, mas aparentemente é só nesse lado que esse bug está acontecendo. Estranho!


2 de Junho de 2014
------------------

Comecei hoje tentando melhorar a questão do som do jogo, mas logo percebi que, se eu fizer isso, vou acabar perdendo muito tempo procurando sons então, #partiu #programação. Em um breve gameplay do Fez original, pude observar que a profundidade Z é atualizada após a troca de câmera e o personagem começar a se mover. Isso foi implementado, mas para que haja total eficácia, agora o tempo está “parando” durante a rotação, assim como no Fez original.

Agora, uma curiosidade: Percebi que o personagem estava respeitando tranquilamente a questão das paredes... MAS SEM FUNÇÃO NENHUMA! Não me lembro de ter feito nada relacionado à “colisão de paredes” ou algo do tipo, e mesmo assim o personagem está respeitando as paredes... Em termos... Quando se tem outro bloco para trás, ele atualizava a profundidade e o personagem acabava indo lá pra trás... “acabava”, pois melhorei o código, e coloquei a detecção de paredes agora. Está funcionando lindamente mas... O desempenho foi pro beleléu com o código que escrevi...

Enfim, boa parte dos bugs foram corrigidos e o jogo está ficando tão polido quanto o original, apesar de ainda haver alguns poucos bugs conhecidos. Está tão polido que, é hora de um executável: https://github.com/leo150250/fez_fangame/blob/master/.EXE-builds/Fez4ever-Default-0.0.0.1.exe?raw=true

P.S.: Preciso de spriters que tenham habilidade com PixelArt. :/

1 de Junho de 2014:
-------------------

Enquanto estava no carro aguardando minha esposa terminar o concurso, resolvi trabalhar mais um pouco no projeto. Não mexi ontem porque não tive tempo.

De início, começou-se com aquela incerteza de “como vou fazer isso?”, mas logo em seguida as respostas começaram a vir. Arrumei primeiramente um bug que havia na detecção da superfície do chão onde, dependendo da velocidade e da altura do personagem, o código anterior fazia com que ele passasse reto pelo chão, o que foi controlado com a ajuda de um código mais limpo, que leva em consideração a velocidade da queda do personagem para verificar se haverá ou não uma colisão com a superfície do bloco.

Arrumei também outro bug que estava fazendo um caos no jogo: Inverti um operador no scr_updatez() dentro de um for, que fazia com que nenhuma profundidade fosse computada na câmera da esquerda (180). Corrigido!

Fiz uma mudança nas texturas também, deixando-as prontas para captar dados também do bloco que está acima e do bloco que está abaixo. Além disso, fiz uma correção no detector dos blocos, e agora ele está funcionando lindamente! Fiz até uma nova fase de testes pra testar isso tudo! E, essa nova fase com feita com o auxílio do editor, ou seja, ele já está salvando arquivos e carregando arquivos tranquilamente!

Porém, essa nova fase me revelou alguns bugs: Quando o personagem está em uma área que tem mais de um bloco no mesmo lugar, mas em alturas diferentes, o atualizador da posição z ignora alguns desses blocos. Não é um efeito intermitente, o que é bom, mas é chato pois não permite que o personagem possa andar tranquilamente em uma ponte normal, sem ser com vários blocos em profundidades diferentes.

Além do mais, a atualização da posição z do personagem ocorre também mesmo quando, ortogonalmente, a plataforma não é vista. Se houver uma plataforma, mas ela está atrás de um muro, ocorre a atualização da posição z, e o personagem vai parar atrás do muro, em cima da plataforma... Isso não é legal, mas acredito que uma breve checagem de "rota de colisão" possa resolver essa pendenga.

Hoje provavelmente lanço um executável pra Windows. 

30 de Maio de 2014:
-------------------
 
Comentários, comentários e comentários... O dia praticamente se envolveu somente com comentários. Porém, esses comentários todos foram para um bom propósito: Agora o código-fonte do jogo está disponível no GitHub: https://github.com/leo150250/fez_fangame

Nesses comentários, andei encontrando alguns bugs menores e tive uma percepção elevada de o que eu estava fazendo... Tem códigos que estão ali para nada, e tem códigos que não fazem corretamente o que deveriam fazer. Tudo isso por causa de comentários, olha só!

Como uma maneira de tentar desfocar de coisas que estão bugadas pra pensar no que fazer com elas depois, comecei o desenvolvimento do editor de fases. O problema é que tem alguns bugs, principalmente com a detecção dos blocos sobre qual bloco é vizinho de qual, o que os faz não calcular direito quem é vizinho de quem, complicando um pouco as coisas. O interessante é que usei o mesmo código que usei nos blocos da fase, mas só agora tive a oportunidade de ver que ele tá com problema. Mas o editor de fases parece excelente, apesar de apenas gravar as fases na memória e não dar pra jogar a fase ainda...

29 de Maio de 2014:
-------------------

Foi aplicado um pequeno efeito de shading nas laterais dos cubos para dar a impressão de que a luz do jogo está vinda de algum lugar. Ainda na questão visual, o gráfico dos cubos está alterando de acordo com sua respectiva posição, se há cubos nas laterais ou não, deixando o visual da fase muito mais “limpo”.

Houve uma melhoria no desempenho, onde as faces dos cubos que estão por dentro e nunca serão vistas agora não são mais renderizadas, dando um ganho absurdo no desempenho.

O problema da colisão de queda do personagem foi corrigido. Agora ele tem uma área de abrangência do cubo em que ele está bem maior do que antes, evitando ele de cair mesmo com outra metade do corpo em cima do cubo, mas ainda há algumas falhas na computação de alteração das posições Z.

O bug da renderização nas laterais das texturas (falta de clamping) foi resolvido com uma solução tão simples que chega a ser ridícula: Renderizar as texturas ao contrário.

E, para uma visão mais ortogonal ainda, que corrigiu também alguns erros de renderização entre vários cubos em diferentes posições que formam uma linha reta, a abertura da câmera foi alterada de 0.035 para 0.001 e a distância da câmera para o personagem foi alterada de 320.000 pixels para 10.000.000 pixels (!).

28 de Maio de 2014:
-------------------

O reconhecimento de 2D em 3D tá funcionando tranquilamente. Antes ele até virava, mas não reconhecia as profundidades diferentes. Agora, o personagem pode trafegar tranquilamente em uma plataforma cujos demais blocos estão em diferentes posições Z, mas lado-a-lado na visão ortogonal, e quando o personagem pisa em um bloco que não está, no 3D, embaixo dele, ele ajusta a posição do personagem para ficar em cima desse bloco, contribuindo para fazer também a rotação da câmera. 

Adicionei um pequeno efeito no fundo, que muda de posição de acordo com a altura do personagem... Se ele vai mais pra cima, o fundo começa a escurecer, e se for pra baixo, fica esbranquiçado. Ainda estou trabalhando em como irei fazer as nuvens ao fundo, talvez faça em skybox, não sei.

Consegui obter o walk cycle do personagem, já está funcionando normalmente, apesar de executar o walk cycle até mesmo no ar, caso o jogador aperte para andar no ar.

Ainda há alguns leves problemas nas colisões, mas nada muito grave. O problema mais chato está sendo a posição do personagem em relação aos cubos: A partir do meio, o personagem pode ainda ter a outra metade do corpo em cima de um cubo, e mesmo assim ele cai, ao invés de ficar "em um pé".

Fiz um pequeno recurso pra poder ver o 3D numa visão um pouco fora da de plataforma, mas preciso removê-la, pois dá pra ver as mudanças na profundidade que o personagem faz.

27 de Maio de 2014:
-------------------

Iniciei o projeto do Fez. A princípio, tive um pequeno probleminha quanto aos índices z dos objetos 3D, fazendo-os renderizar para baixo. No entanto, foi fácil de resolver, apenas invertendo a posição dos valores z.

Ainda há falhas no reconhecimento da profundidade 3D ortogonal, pois o personagem ainda não reconhece que a plataforma “continua” a partir do ponto de visão da câmera, no entanto, o personagem já anda para os lados de acordo com a rotação da câmera, permitindo que ele ande livremente pelo ambiente 3D. Ainda não programei os blocos de diferentes alturas, e o personagem ainda não pula, mas isto é fácil de arrumar, bastando apenas setar a “variável engessada” de renderização da coordenada Z para uma variável que pode ser declarada ao criar o objeto.

A única Sprite que possuo é a do personagem parado, o que causa certo desconforto quando vejo ele andar de um lado para o outro!

De início, parece promissor!
