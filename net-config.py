import subprocess as subp
import getpass
import hashlib

#Coleta a saída stdou gerada pelo comando que contem as interfaces
def getInterfaces(): 
  interfaces = subp.check_output(['ifconfig | grep mtu | grep -v "LOOPBACK" | cut -d: -f1'], shell=True, text=True)
  interfaces = interfaces.split('\n') #Separa as interfaces em uma lista
  interfaces.remove("")
  return interfaces

def getState(intf : str):
  state = subp.check_output(["ifconfig "+intf+" | grep mtu | cut -d'<' -f2 | cut -d',' -f1"], shell=True, text=True)
  state = state.split('\n')
  return state[0]

def getMtu(intf : str):
  mtu = subp.check_output(["ifconfig "+intf+" | grep mtu | cut -d' ' -f5"], shell=True, text=True)
  mtu = mtu.split('\n')
  return mtu[0]

def getIp(intf : str):
  ip = subp.check_output(["ifconfig "+intf+" | grep ' inet ' | sed 's/        //g' | cut -d' ' -f2"], shell=True, text=True)
  ip = ip.split('\n')
  return ip[0]

def getNetmask(intf : str):
  netm = subp.check_output(["ifconfig "+intf+" | grep ' inet ' | sed 's/        //g' | cut -d' ' -f5"], shell=True, text=True)
  netm = netm.split('\n')
  return netm[0]

def getMac(intf : str):
  mac = subp.check_output(["ifconfig "+intf+" | grep ether | sed 's/        //g' | cut -d' ' -f2"], shell=True, text=True)
  mac = mac.split('\n')
  return mac[0]

def printData(intf : str):
  print("Interface: "+intf)
  print("Estate: "+getState(intf))
  print("MTU: "+getMtu(intf))
  print("IP: "+getIp(intf))
  print("Netmask: "+getNetmask(intf))
  print("MAC: "+getMac(intf))
  print()

def exec_cmd(cmd : list):
  #Caso em que não existe o comando digitado 
  if not cmd:
    return
  #Switch case para os comandos
  if cmd[0] == "quit":
    print('Exiting program...')
    exit(1)
  ###################
  if cmd[0] == "list_intf":
    if len(cmd) == 1: #é só o list intf normal mesmo
      for intf in getInterfaces(): #Percorre a lista com todos os paâmetros
        printData(intf)
    elif len(cmd) == 2: #list_intf com parâmetro
      if cmd[1] in getInterfaces(): # Nome da interface está certo
        printData(cmd[1])
      else:
        print("ERROR: The expecified interface do not exists") 
    else:
      print("ERROR: Wrong parameters")

    return
  ###################
  if cmd[0] == "list_routes":
    subp.run(['./list_routes.sh'], shell=True)
    return
  ###################
  if cmd[0] == "make_bridge":
    if len(cmd) == 2:
      #Pega as interfaces
      intf = getInterfaces()
      # Confere se a bridge não existe
      if cmd[1] not in intf:
        print("This command will need to use sudo privileges")
        subp.run(['sudo brctl addbr '+cmd[1]+' && sudo ip link set up dev '+cmd[1]], shell=True)
      else:
        print('ERROR: The expecified interface already exists')
      return  
    else:
      print("ERROR: Please, specify the interface's name")
      return
  ###################
  if cmd[0] == "del_bridge":
    if len(cmd) == 2:
      #Pega as interfaces
      intf = getInterfaces()
      # Confere se a bridge existe
      if cmd[1] in intf:
        print("This command will need to use sudo privileges")
        subp.run(['sudo ip link delete '+cmd[1]+' type bridge '], shell=True)
      else:
        print('ERROR: The expecified interface do not exists')
      return  
    else:
      print("ERROR: Please, specify the interface's name")
      return
  ###################
  if cmd[0] == "configure_ip":
    #Confere se todos os parametros foram escritos
    if len(cmd) == 3:
      intf = getInterfaces()
      if cmd[1] in intf:
        print("This command will need to use sudo privileges")
        command = 'sudo ifconfig '+cmd[1]+' '+cmd[2]+' netmask 255.255.255.0'
        subp.run([command], shell=True)
      else:
        print("ERROR: The expecified interface do not exists")
      return
    else:
      print("ERROR: Please, specify the interface's name and new ip address")
      return

  print('ERROR: Invalid command')
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
    login = input('User: ')
    if login == secret_log:
      for i in range(0,3):
        passw = getpass.getpass("Password: ")
        if hash_passw(passw) == hashed_passw:
          return #Login e senha estão corretos
        else:
          print('Incorrect password, please try again')
      print('ERROR: Limit of password attempts exceeded, exiting program')
      exit(0)
    else:
      print('Incorrect user name, please try again')

  print('ERROR: Limit of login attempts exceeded, exiting program')
  exit(0)
#----------------------------------------------------------------------
def main():
  #Chama login e senha do usuário, se não encerrar está tudo certo
  autentication()
  print('\n<====== Welcome to LINUX net-config ver 1.0 ======>')
  while True:
    command = input('>>> ') #Recebe o comando
    cmd = command.split() #Transforma em lista
    exec_cmd(cmd)  #Valida o comando e executa

#Function main
main()
