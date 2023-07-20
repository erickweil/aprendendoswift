# Instalação do Swift
Este roteiro trás detalhes da instalação do swift em diferentes plataformas, **que não o MacOS**. 

Então se você quer instalar o swift, acesse o link abaixo:
https://www.swift.org/download/

## MacOS
não é necessário explicações de como instalar swift para usuários de MacOS, sendo apenas necessário instalar o XCode.

## Linux

No caso do linux é simples e basta seguir as instruções em https://www.swift.org/download/#linux

Em resumo, irá instalar as dependências, então baixar o pacote do link baseado na sua versão do sistema (lsb_release -a para saber que ubuntu você está) e então terá de instalar o pacote manualmente.

Exemplo para **Ubuntu 22.04.1**, com arquitetura **x64**

```bash
# Veja https://github.com/erickweil/aprendendoswift/blob/main/Tutorial/Instalacao.md
# E também https://gist.github.com/Jswizzy/408af5829970f9eb18f9b45f891910bb

# Instalando as dependências como descrito em https://www.swift.org/download/#linux
sudo apt-get update
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

# Extraindo (irá extrair um diretório chamado 'usr')
tar xzf swift-5.8.1-RELEASE-ubuntu22.04.tar.gz

# Movendo o diretório extraído para um outro diretório qualquer
sudo mv ./swift-5.8.1-RELEASE-ubuntu22.04 /usr/local/swift

# Adicionando o caminho do /usr/bin que foi extraído ao PATH
echo "export PATH=/usr/local/swift/usr/bin/:\$PATH" >> ~/.bashrc
source ~/.bashrc

swift -v
```

## Windows

Antes de considerar a possibilidade de instalar swift no windows, considere a possibilidade de utilizar Linux ou MacOS. Se não é possível utilizar outro sistema a não ser Windows, segue instruções de possibilidades para programar em swift no Windows:

### Opção 1 - Code-Server no Docker

O code-server é uma ferramenta que permite programar no VS-Code direto do navegador, e é possível instalar via Docker. A proposta é: rode a imagem sugerida abaixo no docker e você terá como programar swift utilizando o navegador.

Com o docker instalado, basta **Executar no terminal:**
```bash
docker run -d -p 8080:8080 --privileged erickweil/container-vm:swift
```

E então abrir o Code-Server em seu navegador no endereço http://localhost:8080/
### Opção 2 - Máquina Virtual Linux

Uma possibilidade é instalar utilizando o VirtualBox uma Máquina virtual linux com Ubuntu Server, que não terá gráficos, instalar os adicionais de convidado do VirtualBox e configurar um servidor SSH dentro desta máquina.

Uma vez com a máquina virtual configurada, instale o swift seguindo as instruções de como fazê-lo no Linux, e então poderá executar linux dentro da máquina virtual.

Para ficar mais fácil o desenvolvimento, pode-se utilizar mapeamento de diretório para montar uma pasta do sistema Windows para dentro da máquina virtual, e assim poderá programar utilizando alguma IDE no Windows mesmo e então executar o código via terminal conectado SSH na máquina virtual. (O problema é que o Windows provavelmente não terá highlighting do código)

### Opção 3 - Instalar o swift mesmo

É possível instalar o swift no Windows, e inclusive utilizá-lo no VS-Code, porém é bastante complicado sua instalação e exige várias dependências (Visual Studio 2019) que torna o processo de instalação bastante tedioso.

1. Instalar Swift. siga as instruções em https://www.swift.org/download/#windows

2. Para que o swift funcione no VS Code, é necessário iniciar o VS Code através de um terminal do Visual Studio.
- Abra o terminal `x64 Native Tools Command Prompt for VS 2019` localizado em `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio 2019\Visual Studio Tools\VC`
- utilize cd para nevagar até o diretório desejado
- Execute o comando `code .` para abrir o VS Code no diretório
- Se ainda não o fez, instale a extensão do Swift no VS Code

Isso é necessário para que sejam iniciadas as variáveis de ambiente necessárias para a extensão swift do VS Code executar