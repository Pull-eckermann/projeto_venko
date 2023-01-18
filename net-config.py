import subprocess
import getpass

def exec_cmd(cmd):
  #Switch case para os comandos
  if cmd == "quit":
    print('Encerrando o programa...')
    exit(1)
  if cmd == "list interfaces":
    subprocess.run(['./list_interfaces.sh'], shell=True)
    return
  if cmd == "list routes":
    subprocess.run(['./list_routes.sh'], shell=True)
    return
  if cmd == "create bridge":
    subprocess.run(['./bridge_create.sh'], shell=True)
    return
  if cmd == "configure ip":
    subprocess.run(['./configure_ip.sh'], shell=True)
    return
  #Caso em que não existe o comando digitado 
  if cmd == "":
    return
  print('ERRO: Comando inválido')
  return
#----------------------------------------------------------------------
def autentication():
  #Sistema de login e senha
  secret_log = "admin"
  secreet_pass = "ngk777*"

  for i in range(0,3):
    login = input('Login: ')
    if login == secret_log:
      for i in range(0,3):
        passw = getpass.getpass("Senha: ")
        if passw == secreet_pass:
          return #Login e senha estão corretos
        else:
          print('Senha incorreta, tente novamente')
      print('ERRO: Limite de 3 tentativas da senha excedido, encerrando o programa')
      exit(0)
    else:
      print('Login incorreto, digite novamente')

  print('ERRO: Limite de 3 tentativas do login excedido, encerrando o programa')
  exit(0)
#----------------------------------------------------------------------
def main():
  #Chama login e senha do usuário, se não encerrar está tudo certo
  autentication()
  print('\n<====== Bem vindo ao LINUX net-config ver 1.0 ======>')
  while True:
    command = input('>>> ') #Recebe o comando
    exec_cmd(command)  #Valida o comando e executa

#Function main
main()
