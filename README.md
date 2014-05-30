Fez (Fan-game)
==============

Um pequeno fan-game do Fez, criado por Phil Fish, usando o GameMaker: Studio para recriar o universo do jogo.

A versão utilizada para o desenvolvimento está sendo o GameMaker: Studio Professional Early Access 1.99.

Todas as sprites foram ripadas do jogo original, mas só utilizei o Google pra isso. E o código foi desenvolvido do zero, sem códigos adicionais... E é melhor que continue assim!

Lista de afazeres:
* Precisamos de todas as sprites do Gomez e dos blocos do jogo original!
* O jogo não possui som nenhum ainda. PRECISAMOS DE SOM!

Diário de Bordo
===============
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
