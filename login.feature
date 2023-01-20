#ecoding: UTF-8
#language: pt

Funcionalidade: Login
  Como administrador do servidor
  Fulano quer completar o login no programa net-config
  Para que ele tenha acesso às funcionalidades do programa

Contexto:
  Dado Fulano está na tela de login do programa net-config

Cenário: Login Válido
  E ele preenche as credenciais válidas
  Quando ele teclar em ENTER
  Então ele acessa a tela de comandos e uma mensagem de bem vindo é exibida

Cenário: Login com nome de usuário errado
  Quando ele preenche o nome de usuário incorretamente
  E ele teclar em ENTER
  Então o sistema exibirá uma mensagem de usuário incorreto e solicitará o repreenchimento

Cenário: Login com nome de usuário exedendo 3 tentativas erradas
  E ele preenche o nome de usuário incorretamente pela terceira vez
  Quando ele teclar em ENTER
  Então o sistema encerra exibindo uma mensagem de erro por tentativas exedidas

Cenário: Login com nome de usuário correto
  E ele preenche o usuário corretamente
  Quando ele teclar em ENTER
  Então o sistema solicitará o preenchimento da senha

Cenário: Login com senha errada
  E ele preenche o nome de usuário incorretamente
  Quando ele teclar em ENTER
  Então o sistema exibirá uma mensagem de senha incorreta e solicitará o repreenchimento

Cenário: Login com senha errada
  E ele preencheu o nome de usuário corretamente
  E ele preenche a senha incorretamente pela terceira vez
  Quando ele teclar em ENTER
  Então o sistema encerra exibindo uma mensagem de erro por tentativas exedidas