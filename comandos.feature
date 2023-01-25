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
  Then an error message will be displayed indicating that it is a invalid command

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
  Then a list of the ip routes will be displayed, ordered by static routes, dynamic routes and ethernet route

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

Scenario: list_intf without parameters
  When I execute the command "list_intf" without specifying the Interface
  Then all Linux interfaces will be listed ordered by interface name

  Result:
    user@name:~/Documentos/projeto_venko$ python3 net-config.py
    User: admin
    Password: 

    <====== Welcome to LINUX net-config ver 1.0 ======>
    >>> list_intf
    Interface: br0
    Estate: UP
    MTU: 1500
    IP: 
    Netmask: 
    MAC: d2:59:91:b0:1c:d6

    Interface: wlo1
    Estate: UP
    MTU: 1500
    IP: 192.168.235.52
    Netmask: 255.255.255.0
    MAC: 38:fc:98:50:41:d7

    >>> 

Scenario: list_intf especifying a interface 
  When I execute the command "list_intf", passing a Interface as a parameter
  Then only the specified interface will be displayed

  Result:
    user@name:~/Documentos/projeto_venko$ python3 net-config.py
    User: admin
    Password: 

    <====== Welcome to LINUX net-config ver 1.0 ======>
    >>> list_intf wlo1
    Interface: wlo1
    Estate: UP
    MTU: 1500
    IP: 192.168.235.52
    Netmask: 255.255.255.0
    MAC: 38:fc:98:50:41:d7

    >>> 

Scenario: list_intf especifying a nonexistent interface
  When I execute the command "list_intf", passing a nonexistent interface as a parameter
  Then an error message will be displayed indicating that the interface do not exist

  Result:
    user@name:~/Documentos/projeto_venko$ python3 net-config.py
    User: admin
    Password: 

    <====== Welcome to LINUX net-config ver 1.0 ======>
    >>> list_intf nothing
    ERROR: The expecified interface do not exists
    >>> 

Scenario: list_intf with more than two parameters
  When i execute "list_intf" with more than two parameters
  Then an error message will be displayed indicating wrong parameters

  Result:
    user@name:~/Documentos/projeto_venko$ python3 net-config.py
    User: admin
    Password: 

    <====== Welcome to LINUX net-config ver 1.0 ======>
    >>> list_intf bla bla
    ERROR: Wrong parameters
    >>> 

Scenario: make_bridge without parameter
  When i execute "make_bridge" without specifying the bridge's name
  Then an error message will be displayed asking for the bridge's name

  Result:
    user@name:~/Documentos/projeto_venko$ python3 net-config.py
    User: admin
    Password: 

    <====== Welcome to LINUX net-config ver 1.0 ======>
    >>> make_bridge
    ERROR: Please, specify the interface's name
    >>> 

Scenario: make_bridge especifying the bridge's name
  When i execute "make_bridge" passing the bridge's name as a parameter
  Then sudo privileges will be required
  And a bridge will be created with the especified name

  Result:
    user@name:~/Documentos/projeto_venko$ python3 net-config.py
    User: admin
    Password: 

    <====== Welcome to LINUX net-config ver 1.0 ======>
    >>> make_bridge br0
    >>> list_intf br0
    Interface: br0
    Estate: UP
    MTU: 1500
    IP: 
    Netmask: 
    MAC: d2:59:91:b0:1c:d6

    >>> 

Scenario: make_bridge with a bridge that already exists
  When i execute "make_bridge" passing a name of a interface that already exists
  Then an error message will be displayed indicating that the bridge already exists

  Result:
    user@name:~/Documentos/projeto_venko$ python3 net-config.py
    User: admin
    Password: 

    <====== Welcome to LINUX net-config ver 1.0 ======>
    >>> make_bridge br0
    ERROR: The expecified interface already exists
    >>> 

Scenario: del_bridge without parameter
  When i execute "del_bridge" without specifying the bridge's name
  Then an error message will be displayed asking for the bridge's name

  Result:
    user@name:~/Documentos/projeto_venko$ python3 net-config.py
    User: admin
    Password: 

    <====== Welcome to LINUX net-config ver 1.0 ======>
    >>> del_bridge
    ERROR: Please, specify the interface's name
    >>> 

Scenario: del_bridge especifying the bridge's name
  When i execute "del_bridge" passing the bridge's name as a parameter
  Then Then sudo privileges will be required
  And the especified bridge will be deleted

  Result:
    user@name:~/Documentos/projeto_venko$ python3 net-config.py
    User: admin
    Password: 

    <====== Welcome to LINUX net-config ver 1.0 ======>
    >>> del_bridge br0
    >>> list_intf br0
    ERROR: The expecified interface do not exists
    >>>

Scenario: del_bridge with a bridge that don't exists
  When i execute "del_bridge" passing a name of a interface that don't exists
  Then an error message will be displayed indicating that the bridge don't exists

  Result:
    user@name:~/Documentos/projeto_venko$ python3 net-config.py
    User: admin
    Password: 

    <====== Welcome to LINUX net-config ver 1.0 ======>
    >>> del_bridge bla
    ERROR: The expecified interface do not exists
    >>>

Scenario: configure_ip with valid parameters
  When i execute the command "configure_ip" with the correct parameters
  Then sudo privileges will be required
  And the new ip will be associated with the specified interface

  Result:
    user@name:~/Documentos/projeto_venko$ python3 net-config.py
    User: admin
    Password: 

    <====== Welcome to LINUX net-config ver 1.0 ======>
    >>> configure_ip br0 172.30.20.20
    This command will need to use sudo privileges
    [sudo] senha para eckermann:
    >>> 
    >>> list_intf br0
    Interface: br0
    Estate: UP
    MTU: 1500
    IP: 172.30.20.20
    Netmask: 255.255.255.0
    MAC: d2:59:91:b0:1c:d6

    >>> 

Scenario: configure_ip with invalid parameters
  When i execute the command "configure_ip" with invalid parameters
  Then an error message will be displayed indicating correct order of parameters

  Result:
    user@name:~/Documentos/projeto_venko$ python3 net-config.py
    User: admin
    Password: 

    <====== Welcome to LINUX net-config ver 1.0 ======>
    >>> configure_ip bla                 
    ERROR: Please, specify the interface's name and new ip address
    >>>

Scenario: configure_ip with a interface name that do not exists
  When i execute the command "configure_ip" with a nonexistent interface as a parameter
  Then an error message will be displayed indicating that the interface do not exist

  Result:
    user@name:~/Documentos/projeto_venko$ python3 net-config.py
    User: admin
    Password: 

    <====== Welcome to LINUX net-config ver 1.0 ======>
    >>> configure_ip bla 172.30.20.20   
    ERROR: The expecified interface do not exists
    >>> 
