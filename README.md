# Como usar

1. Clone este repositório em sua máquina.


1. Crie as tabelas necessárias para o funcionamento do seu projeto no seu Banco de Dados.
- Siga as instruções no arquivo **/site/src/database/script-tabelas.sql**


3. Acesse o arquivo **/site/app.js** e parametrize o ambiente.
- Se você estiver utilizando o Ambiente de Produção (SQL Server na nuvem Azure, remoto), comente a linha 1 e deixe habilitada a linha 2 onde está o valor **process.env.AMBIENTE_PROCESSO = "producao";**
- Se você estiver utilizando o Ambiente de Desenvolvimento (MySQL Workbench, local), comente a linha 2 e deixe habilitada a linha 1 onde está o valor **process.env.AMBIENTE_PROCESSO = "desenvolvimento";**

4. Adicione as credenciais de Banco de Dados no arquivo **/site/src/database/config.js**, seguindo as instruções neste.

5. Acesse o local do diretório **/site** presente neste repositório no seu terminal (GitBash ou VSCode) e execute os comandos abaixo:

```
npm i
``` 
_O comando acima irá instalar as bibliotecas necessárias para o funcionamento do projeto. As bibliotecas a serem instaladas estão listadas no arquivo **package.json** então é muito importante que este não seja alterado. Será criada uma nova pasta/diretório chamado **node_modules** quando o comando for finalizado, que é onde as bibliotecas estão localizadas. Não altere a pasta/diretório._

```
npm start
``` 

_O comando acima irá iniciar seu projeto e efetuar os comandos de acordo com a sua parametrização feita nos passos anteriores._

6. Para "ver" seu projeto funcionando, acesse em seu navegador o caminho **informado no terminal**.

7. Caso queira parar a execução, tecle **CTRL+C** no terminal em que o projeto está rodando.
