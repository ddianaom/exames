# Repositório de Exames de Sangue com Blockchain

Este é um trabalho desenvolvido na matéria de Oficina de Desenvolvimento de Sistemas I, onde nos foi solicitado um projeto que fizesse uso de smart contracts e IPFS.
O sistema aqui desenvolvido consiste em um repositório anônimo de exames de sangue, onde é possível fazer upload dos seus exames, sendo estes vinculados a sua carteira digital (Metamask). O usuário possui a opção de compartilhar o acesso de exames específicos com outros usuários, fornecendo o endereço das carteiras destes. Caso queiro, também é possível revocar o acesso.

## Tecnologias necessárias

 - [Python 3](https://www.python.org/downloads/);
 - [Node/NPM](https://nodejs.org/en/download/package-manager)
 - [Metamask](https://metamask.io/);
 - [Ganache](https://archive.trufflesuite.com/ganache/);
 - [Truffle](https://archive.trufflesuite.com/docs/truffle/how-to/install/)


## Deploy no Smart Contract
No ganache, crie um novo **workspace** e adicione em **Truffle Project** o arquivo **truffle-config.json**, que está na raiz do projeto. Em seguida click em **Start**.

![image](https://github.com/user-attachments/assets/8a0874bb-fae1-46e1-81d2-791dbf688d70)

Por fim você terá uma rede blockchain falsa com carteiras digitais disponíveis. Precisamos agora adicionar o nosso smart contract nela.

![image](https://github.com/user-attachments/assets/52c7e2ee-d860-4162-8f28-4da186fead56)

Abra um terminal na raiz do projeto e execute o seguinte comando:

    $ truffle migrate

No terminal será retornado algo semelhante a isso:

![image](https://github.com/user-attachments/assets/48df0d04-6baa-4f14-ac23-3221920449cb)

Copie o valor em **contract address** e o coloque no local especificado em cada página que o necessita (SeeExam.html, SeeSharedExam.html, StoreExam.html).

![image](https://github.com/user-attachments/assets/104ed8e6-c3e2-4b6c-8554-043842153bee)

Além do endereço de contrato, com a execução do comando anterior será criado/alterado um arquivo de nome BloodExams.json no diretório **./build/contracts***.

![image](https://github.com/user-attachments/assets/4cbeb41b-b5c0-4e13-b1dd-59dc9cd140ea)

Lá, bem no começo, há o valor de **"abi"**, uma lista de dicionários com dados referentes ao contrato executado. Copie todo o conteúdo dele e o cole nas mesmas páginas que pediram o contract address.

![image](https://github.com/user-attachments/assets/aa4ce28e-a187-4caf-a20c-d5f7b736dff4)

![image](https://github.com/user-attachments/assets/94bef87c-29fe-4a48-9304-ac75dc984015)

## Importação de contas com Ganache

Baixe todo o que foi informado anteriormente. Ao instalar a extensão do **Metamask** no seu navegador de preferência, você será direcionado para uma página de instruções para criar a sua carteira, basta seguir o passo a passo.

Em seguida, com o **Ganache** instalado, configure ele de forma que possa utilizar seus endereços de teste no Metamask. Para evitar um texto extenso aqui, recomendamos que siga as instruções fornecidas [aqui](https://docs.cranq.io/web-3/setting-up-ganache-with-metamask). Ao fim deve ser possível ter pelo menos dois endereços de carteiras importados para que se teste a aplicação, em especial a funcionalidade de compartilhamento de exames.

## Executando a aplicação

Para facilitar o trabalho, optamos por criar uma aplicação com puro HTML e CSS. Para rodar o sistema deve-se abrir a página **index.html** com um servidor de desenvolvimento local. Caso esteja utilizando o VS Code, IDE de desenvolvimento, pode optar por utilizar a extensão **Live Server** para esta tarefa.

![image](https://github.com/user-attachments/assets/f55415b0-9848-4cb3-9878-5d5da08211bf)

![image](https://github.com/user-attachments/assets/1da9ee6d-1ede-4863-8851-817d7905b629)

Por fim você terá a aplicação rodando, pronta para ser testada!

![image](https://github.com/user-attachments/assets/b9adb70a-3f81-4f73-9834-4100974f8f5b)

## Vídeo da Aplicação
// A ser criado...
