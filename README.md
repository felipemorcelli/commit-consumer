# README #

Este repositório contém todos os arquivos necessários para implantação e utilização da aplicação **Commit-Consumer**.

### Aplicação ###

Esta aplicação tem como objetivo oferecer, em arquivos CSV gravados na pasta ```output``` (disponível na raíz do sistema), uma listagem dos maiores contribuidores do projeto **Dinda-com-br/braspag-rest** por ordem decrescente de contribuições.

### Tecnologia ###

O Commit-Consumer foi criado e desenvolvido utilizando **Ruby** em uma máquina **Ubuntu**, sem frameworks, apenas com as bibliotecas padrão da linguagem. Foram utilizadas `gems` apenas para criação e visualização de testes unitários.

### Requisitos ###

- Ubuntu 16.04
- Ruby 2.x
- Gems rspec e simplecov

Detalhes de como configurá-las estão logo abaixo.

### Instalação & Configuração ###

Para utilizar o repositório, desenvolver e testar a aplicação siga os seguintes passos na ordem:

- Instalar o Ruby no seu sistema operacional seguindo a documentação oficial da linguagem, disponível em https://www.ruby-lang.org/pt/documentation/installation/
- Certifique-se de o Ruby esteja funcionando após esse procedimento - uma forma de fazê-lo é com o comando `ruby -v` para validar o funcionamento da linguagem e receber sua versão como retorno do comando
- Certifique-se também de que o git está instalado na sua máquina. Caso não esteja, siga as instruções disponíveis em https://www.hostinger.com.br/tutoriais/tutorial-do-git-basics-introducao/#Passo-1-8211-Instalando-o-GIT-em-diferentes-sistemas
- Em seguida, clone o repositório desta aplicação através do comando `git clone https://github.com/felipemorcelli/commit-consumer` em um diretório de sua escolha
- Deve-se instalar duas `gems` para poder executar os testes unitários da aplicação: **rspec** e **simplecov**. Através desta última é possível verificar o relatório de cobertura de testes. Faça isso no diretório da aplicação com o comando `gem install nome_da_gem`.

Pronto! O código do **Commit-Consumer** está no seu computador! Mas ainda faltam alguns passos...

#### Utilização da API do Github ####

É muito importante que uma chave de API para acesso à API do Github seja gerada. Ainda que ela seja pública, há limitações para quem não utiliza a chave (ou token) no cabeçalho do acesso. É um **requisito fundamental** para o funcionamento desta aplicação. Para gerar sua própria chave de acesso, acesse o link https://github.com/settings/tokens e logue, se necessário, com sua conta.

Ao solicitar a criação de um novo token, ofereça um descrição qualquer (ex: `Obtain basic repository information`) e marque as opções `repo:status`, ` repo:deployment`, `public_repo` `read:user`. São as únicas necessárias para o funcionamento da **Commit-Consumer**.

Após a geração da API, copie a hash gerada pelo Github e a coloque na chave `access_token` do arquivo `config/config.yml`.

Pronto! Você já pode usar o **Commit-Consumer**! Mas como fazê-lo?

#### Utilização - Aplicação ####

Basta executar o comando ```ruby -Ilib ./bin/commit_consumer``` no diretório raiz da aplicação. Um arquivo CSV deve ser gerado no diretório **output** contendo as informações obtidas pelo sistema, formatadas da forma requerida.

#### Utilização - Testes ####

- Com as `gems` de teste instaladas, basta executar o comando `rspec`, em um terminal, na raiz da aplicação. Os testes serão executados e um relatório da cobertura deles aparecerá na pasta `coverage`.

Importante: as pré-definições para os testes estão no arquivo ```spec/spec_helper.rb```.
