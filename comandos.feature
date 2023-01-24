#ecoding: UTF-8
#language: en

Feature: Command execution
  As an server administrator
  I successfully logged in to net-config program
  So that i can execute commands on net-config

Background: 
  Given I successfully logged in
  And I'm on the command screen

Scenario: Digitar um comando inválido
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
