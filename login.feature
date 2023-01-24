#ecoding: UTF-8
#language: en

Feature: Login
  As a server administrator
  I want to successfully login in the net-config program
  So that i can have access to the program features

Background:
  Given i'm on the login screen of the net-config program

Scenario: Valid Login
  When i fill in with the valid credentials
  Then i successfully login in the program
  And i can now execute commands
  
  Result:
  user@name:~/Documentos/projeto_venko$ python3 net-config.py
  User: admin
  Password:

  <====== Welcome to LINUX net-config ver 1.0 ======>
  >>>
  
Scenario: login attempt with a incorrect user name
  When i fill in with a incorrect user name
  Then the system will show a message informing that the user name is incorrect 
  And will ask to try again
  
  Result:
  user@name:~/Documentos/projeto_venko$ python3 net-config.py
  User: admoka
  Incorrect user name, please try again
  User:

Scenario: login attempt with a incorrect user name exceeding three attempts
  When i fill in with a incorrect user name for the third time
  Then the system will close showing an error message informing that the three attempts was exceeded
  
  Result:
  user@name:~/Documentos/projeto_venko$ python3 net-config.py
  User: admoka
  Incorrect user name, please try again
  User: admino
  Incorrect user name, please try again
  User: adm
  Incorrect user name, please try again
  ERROR: Limit of login attempts exceeded, exiting program

Scenario: Login with a correct user name
  When i fill in with the correct user name
  Then the system will accept
  And will ask for the password
  
  Result:
  user@name:~/Documentos/projeto_venko$ python3 net-config.py
  User: admin
  Password:


Scenario: Login attempt with a incorrect password
  And i filled with the correct user
  When i execute a login attempt in with a incorrect password
  Then the system will show a message informing that the password is incorrect 
  And will ask to try again
  
  Result:
  user@name:~/Documentos/projeto_venko$ python3 net-config.py
  User: admin
  Password:
  Incorrect password, please try again
  Password:

Scenario: Login attempt with a incorrect password exceeding three attempts
  And i filled in with a incorrect password two times
  When i execute a login attempt in with a incorrect password for the third time
  Then the system will close showing an error message informing that the three attempts was exceeded
  
  Result:
  user@name:~/Documentos/projeto_venko$ python3 net-config.py
  User: admin
  Password:
  Incorrect password, please try again
  Password:
  Incorrect password, please try again
  Password:
  Incorrect password, please try again
  ERROR: Limit of password attempts exceeded, exiting program
