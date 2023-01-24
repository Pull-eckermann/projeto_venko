Sistema para configuração básica em redes, criado com referência a distro Linux Ubuntu 22

Para rodar a interface é necessário ter os seguintes pacotes:
- python3
- net-tools
- bridge-utils

Comandos disponíveis:
- list_intf (Lista todas as interfaces de rede em ordem alfabética de uma forma amigável ao usuário)
  -> list_intf ethx (Lista somente as informações da interface expecificada)
- list_routes (Lista todas as rotas de rede do sistema de uma forma amigável ao usuário)
- make_brigde ethx (Cria uma bridge básica com o nome expecificado como parâmetro)
- del_bridge ethx (Deleta uma bridge expecificada no parâmetro do comando)
- configure_ip ethx xxx.xxx.xxx.xxx (Altera o ip expecificado em parâmetros na interface especificada em parâmetros)

Para a execução:
- Garanta que todos os arquivos estejam na mesma pasta
- Scripts bash precisam ter permissão de execução
- rode o programa com o seguinte comando: python3 net-config.py

