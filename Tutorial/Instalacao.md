# Instalação do Swift
Este roteiro trás detalhes da instalação do swift em diferentes plataformas. 

> Veja que este processo não é necessário para usuários de MacOS, sendo apenas necessário instalar o XCode.

Para começar, o swift pode ser baixado no link abaixo:
https://www.swift.org/download/

## Linux

No caso do linux é simples e basta seguir as instruções em https://www.swift.org/download/#linux

Em resumo, irá instalar as dependências, então baixar o pacote do link baseado na sua versão do sistema (lsb_release -a para saber que ubuntu você está) e então terá de instalar o pacote manualmente.

Exemplo para Ubuntu 22.04.1, com arquitetura x64

```bash
# Instalando as dependências como descrito em https://www.swift.org/download/#linux
supo apt-get update
sudo apt-get install \
          binutils \
          git \
          gnupg2 \
          libc6-dev \
          libcurl4-openssl-dev \
          libedit2 \
          libgcc-9-dev \
          libpython3.8 \
          libsqlite3-0 \
          libstdc++-9-dev \
          libxml2-dev \
          libz3-dev \
          pkg-config \
          tzdata \
          unzip \
          zlib1g-dev
# Baixando o pacote
wget https://download.swift.org/swift-5.8.1-release/ubuntu2204/swift-5.8.1-RELEASE/swift-5.8.1-RELEASE-ubuntu22.04.tar.gz

# Extraindo (Terá um diretório /usr)
tar xzf swift-5.8.1-RELEASE-ubuntu22.04.tar.gz

# Movendo o diretório /usr para um outro diretório qualquer
sudo mv swift-5.8.1-RELEASE-ubuntu22.04/usr/ /swiftusr

# Adicionando o caminho do /usr/bin que foi extraído ao PATH
export PATH=/swiftusr/bin/:"${PATH}"
```

Adicione a última linha `export PATH=/swiftusr/bin/:"${PATH}` ao seu ~/.bashrc para que a adição ao PATH seja permanente.

