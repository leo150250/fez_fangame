Arquivos diversos
=================

Aqui ficam guardados alguns arquivos que podem auxiliá-lo nos testes.

Arquivos .f4e
-------------
São arquivos de fase, criados com o editor de fases embutido no jogo.
Alguns destes arquivos servem para testar se há bugs ou não. Seguem-se:

* APDA.f4e
  * Nenhum bug encontrado, apenas glitches devido à MUITA profundidade envolvida.
* Teste_profundidade.f4e
  * Uma das plataformas na frente do paredão não consegue ter sua profundidade computada, fazendo o Gomez passar direto por ela.
* Torre.f4e
  * Nenhum bug encontrado.
* teste2.f4e
  * Quando a câmera está virada na direção 90, quando o Gomez está na 2ª plataforma do bloco central e o jogador faz ele CAIR, a profundidade do Gomez atualiza e ele vai para frente, não como o que acontece na mesma plataforma com a câmera em 270, que seria o ideal.
* teste3.f4e
  * Se tentar atravessar o "moinho" no meio do mapa andando, o personagem cairá "do nada" logo ao alcançá-lo.
* teste_cubebits.f4e
  * Por falha de cálculo de profundidade, o cubebit da base da fase não pôde ser alcançado, pois o personagem CAI direto quando se tenta ir lá.
* teste_texturas.f4e
  * A profundidade está IMPRATICÁVEL nesta fase. Bugs por todos os lados. Deve ser considerada como prova de fogo, apesar de ser totalmente possível a fase.
