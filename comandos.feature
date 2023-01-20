#ecoding: UTF-8
#language: pt

Funcionalidade: Execução de comandos
  Como administrador do servidor
  Fulano completou login no programa net-config
  Para executar comandos de visualização e de configuração de rede

Contexto: 
  Dado que Fulano completou login e está na tela de comando

Cenário: Digitar um comando inválido
  Quando ele digita e tecla em ENTER com um comando não reconhecido
  Então uma mensagem de erro é exibida indicando um comando inválido, e nada é executado

Cenário: Teclar em ENTER com a entrada vazia
  Quando ele tecla em ENTER sem digitar nada na linha de comando
  Então nada acontece e uma nova linha surge requisitando um comando novo


Cenário: Vizualizar interfaces de Rede
  Quando ele executar o comando "list interfaces"
  Então As interfaces de rede serão listadas uma abaixo da outra, junto com as informações 
de estado, mtu, endereço ip e endereço mac

Cenário: Visualizar rotas


