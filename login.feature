#ecoding: UTF-8
#language: en

Feature: Login
  As a server administrator
  I want to successfully login in the net-config program
  So that i can have access to the program features

Background:
  Given i'm on the login screen of the net-config program

Scenario: Valid Login
  When i fill in whith the valid credentials
  And i press ENTER
  Then i successfully login in the program
  And i can now execute commands 

Cenário: Login com nome de usuário errado
  Quando eu preencho o nome de usuário incorretamente
  E eu teclo em ENTER
  Então o sistema exibirá uma mensagem de usuário incorreto e solicitará o repreenchimento

Cenário: Login com nome de usuário exedendo 3 tentativas erradas
  Quando eu preencho o nome de usuário incorretamente pela terceira vez
  E eu teclo em ENTER
  Então o sistema encerra exibindo uma mensagem de erro por tentativas exedidas

Cenário: Login com nome de usuário correto
  Quando eu preenche o usuário corretamente
  E teclo em ENTER
  Então o sistema solicitará o preenchimento da senha

Cenário: Login com senha errada
  E eu preencho o nome de usuário corretamente
  Quando eu preencho a senha incorretamente
  E eu teclo em ENTER
  Então o sistema exibirá uma mensagem de senha incorreta e solicitará o repreenchimento

Cenário: Login com senha errada
  E eu preencho o nome de usuário corretamente
  Quando eu preencho a senha incorretamente pela terceira vez
  E eu teclo em ENTER
  Então o sistema encerra exibindo uma mensagem de erro por tentativas exedidas