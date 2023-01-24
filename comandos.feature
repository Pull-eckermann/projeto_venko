#ecoding: UTF-8
#language: en

Feature: Command execution
  As an server administrator
  I successfully logged in to net-config program
  So that i can execute commands on net-config

Background: 
  Given I successfully logged in
  And I'm on the command screen

Scenario: Invalid command
  When i execute a command that is not recognized
  Then an error message is displayed indicating that it is a invalid command

  Result:
  user@name:~/Documentos/projeto_venko$ python3 net-config.py
  User: admin
  Password: 
  
  <====== Welcome to LINUX net-config ver 1.0 ======>
  >>> ads
  ERROR: Invalid command
  >>> 

Scenario: Empty command
  When I just hit ENTER button with a empty entrance
  Then nothing happens and a new line comes out asking for a command

  Result:
  user@name:~/Documentos/projeto_venko$ python3 net-config.py
  User: admin
  Password: 
  
  <====== Welcome to LINUX net-config ver 1.0 ======>
  >>>
  >>> 
  >>>

Scenario: list_routes
  When I execute the command "list_routes"
  Then a list of the ip routes is displayed, ordered by static routes, dynamic routes and ethernet route

  Result:
  user@name:~/Documentos/projeto_venko$ python3 net-config.py
  User: admin
  Password: 

  <====== Welcome to LINUX net-config ver 1.0 ======>
  >>> list_routes
  ========================Static Routes========================
   Destination Network          Prox Server            Interface
               default       192.168.235.39                 wlo1
  ========================Dynamic Routes========================
   Destination Network          Prox Server            Interface
  ==================Bus-connected Routes==================
   Destination Network            Interface
        169.254.0.0/16                 wlo1
      192.168.235.0/24                 wlo1
  >>> 

Scenario: list_interfaces
