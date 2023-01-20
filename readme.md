Sistema para configuração básica em redes.

Sistema criado com referência a distro Linux Ubuntu

Para rodar a interface é necessário ter os seguintes pacotes:
- python3
- net-tools
- brifge-utils

Comandos disponíveis:
- list_interfaces (Lista todas as interfaces de rede de uma forma amigável ao usuário)
- list_routes (Lista todas as rotas de rede do sistema de uma forma amigável ao usuário)
- make_brigde (Cria uma bridge básica de nome e ip prédefinidos)
- del_bridge (Deleta uma bridge expecificada)
- configure_ip (Irá solicirtar Interface e novo ip. Altera o ip expecificado na interface especificada)

Para a execução:
- Garanta que todos os arquivos estejam na mesma pasta
- Scripts bash precisam ter permissão de execução

