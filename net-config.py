import subprocess as subp
import getpass
import hashlib

def exec_cmd(cmd : list):
  #Caso em que não existe o comando digitado 
  if not cmd:
    return
  #Switch case para os comandos
  if cmd[0] == "quit":
    print('Encerrando o programa...')
    exit(1)
  ###################
  if cmd[0] == "list_interfaces":
    subp.run(['./list_interfaces.sh'], shell=True)
    return
  ###################
  if cmd[0] == "list_routes":
    subp.run(['./list_routes.sh'], shell=True)
    return
  ###################
  if cmd[0] == "make_bridge":
    if len(cmd) == 2:
      #Coleta a saida stdou gerada pelo comando que contem as interfaces
      interfaces = subp.check_output(['ifconfig | grep mtu | grep -v "LOOPBACK" | cut -d: -f1'], shell=True, text=True)
      interfaces = interfaces.split('\n') #Separa as interfaces em uma lista
      # Confere se a bridge não existe
      if cmd[1] not in interfaces:
        print("Este comando irá utilizar privilégios de super usuário")
        subp.run(['sudo brctl addbr '+cmd[1]+' && sudo ip link set up dev '+cmd[1]], shell=True)
      else:
        print('ERRO: A interface de nome '+cmd[1]+' ja existe')
      return  
    else:
      print("ERRO: Por favor especifique o nome da bridge a ser criada")
      return
  ###################
  if cmd[0] == "del_bridge":
    if len(cmd) == 2:
      #Coleta a saída stdou gerada pelo comando que contem as interfaces
      interfaces = subp.check_output(['ifconfig | grep mtu | grep -v "LOOPBACK" | cut -d: -f1'], shell=True, text=True)
      interfaces = interfaces.split('\n') #Separa as interfaces em uma lista
      # Confere se a bridge existe
      if cmd[1] in interfaces:
        print("Este comando irá utilizar privilégios de super usuário")
        subp.run(['sudo ip link delete '+cmd[1]+' type bridge '], shell=True)
      else:
        print('ERRO: A interface de nome '+cmd[1]+' não existe')
      return  
    else:
      print("ERRO: Por favor especifique o nome da bridge a ser deletada")
      return
  ###################
  if cmd[0] == "configure_ip":
    #Confere se todos os parametros foram escritos
    if len(cmd) == 3:
      print("Este comando irá utilizar privilégios de super usuário")
      command = 'sudo ifconfig '+cmd[1]+' '+cmd[2]+' netmask 255.255.255.0'
      subp.run([command], shell=True)
      return
    else:
      print("ERRO: Por favor, especifique a interface a ser alterada e o novo ip")
      return

  print('ERRO: Comando inválido')
  return
#----------------------------------------------------------------------
def hash_passw(passw):
  hashed_passw = hashlib.sha256(passw.encode()).hexdigest()
  return hashed_passw

def autentication():
  #Sistema de login e senha
  secret_log = "admin"
  #Senha cifrada com tabela hash
  hashed_passw = "bfe9065b538472c89fba94715a79bc3b7963223f19c1a4cf0c1caf7afa01a296"

  for i in range(0,3):
    login = input('Usuario: ')
    if login == secret_log:
      for i in range(0,3):
        passw = getpass.getpass("Senha: ")
        if hash_passw(passw) == hashed_passw:
          return #Login e senha estão corretos
        else:
          print('Senha incorreta, tente novamente')
      print('ERRO: Limite de 3 tentativas da senha excedido, encerrando o programa')
      exit(0)
    else:
      print('Usuário incorreto, digite novamente')

  print('ERRO: Limite de 3 tentativas do login excedido, encerrando o programa')
  exit(0)
#----------------------------------------------------------------------
def main():
  #Chama login e senha do usuário, se não encerrar está tudo certo
  #autentication()
  print('\n<====== Bem vindo ao LINUX net-config ver 1.0 ======>')
  while True:
    command = input('>>> ') #Recebe o comando
    cmd = command.split()
    exec_cmd(cmd)  #Valida o comando e executa

#Function main
main()
