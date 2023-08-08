# Hello
Este roteiro tem como objetivo guiar pelo processo de como funciona a linguagem swift de forma geral, sendo um bom ponto de partida para seu aprendizado. 

## Introdução à Swift
![Logo](https://developer.apple.com/swift/images/swift-logo.svg)

Antes de começarmos a programar, é importante saber o que é a linguagem Swift e da onde ela veio.

A linguagem Swift é uma linguagem relativamente nova, [foi anunciada no WWDC em 2014](https://www.youtube.com/watch?v=MO7Ta0DvEWA) como uma substituição ao Objective-C, sendo Swift um Objective-C sem a 'complicação' do C

É uma linguagem com várias características de linguagens compiladas, possuindo forte tipagem e produzindo erros de compilação (aqueles que aparecem antes mesmo do código ser executado) Mas ao mesmo tempo características como inferência de tipos e funções como tipos que podem ser passados como se fossem variáveis o que torna a linguagem bastante versátil.

Nos últimos anos Swift mudou bastante, a maioria das mudanças aconteceram nos primeiros anos, em 2015 com Swift 2.0 se tornou uma linguagem [Open Source](https://www.swift.org/) permitindo colaboração da comunidade.

Em 2016 Swift 3.0 foi lançado e muito da linguagem mudou, sendo chamado de 'A Grande Renomeação'. Provavelmente pesquisas antigas, de antes de 2016, irão dar resultados de código swift que não funciona nas versões mais recentes.

As mudanças então foram desacelerando e 2017 foi lançado swift 4.0, em 2018 swift 4.2, e hoje estamos no swift 5.8.1 e não há previsão exata de quando uma nova versão será lançada

## Instalação

Veja o arquivo dedicado [Instalacao.md](Instalacao.md), mas basicamente:

- Se você está no MacOS, basta instalar o XCode.
- Se você está no Linux ou Windows, veja as instruções na seção [Getting Started](https://www.swift.org/getting-started/) do swift.org
  
## Primeiros passos com Swift
Para um passo-a-passo de como começar a executar programas swift, veja [Hello.md](Hello.md)

# Linguagem Swift
Para iniciar, veja este exemplo para iniciar a entender como é a linguagem Swift

[Hello.swift](./Exemplos/Hello.swift)
```swift
print("Olá Swift!")

let a = 1
let b = 2
let c = a + b
print("a + b = \(c)")
```

Veja que se escreve na saída de dados chamando a função **print**, se declara variáveis utilizando a palavra reservada **let**, não é necessário ponto e vírgula, e a concatenação do texto acontece utilizando barra invertida e parênteses dentro das aspas `\()` (Quase como um template literal no js)

## Tabela de Conteúdos
Clique no assunto que deseja ler sobre:

## Tutorial Sobre a Linguagem Swift em si
- [Tipos e Variaveis](Variaveis.md)
- [Entrada e Saída](EntradaESaida.md)
- [Operadores e Expressões](Operadores.md)
- [Arrays](Arrays.md)
- [Condições](Condicoes.md)
- [Repetição](Repeticao.md)
- [Optionals](Optionals.md)
- [Funções](Funcoes.md)
- [Structs, Classes e Enums](Structs.md)
- Genéricos
- Protocols e Extensions
- Threads e Queues

## Tutorial específico ambiente App iOS
- [Introdução SwiftUI](SwiftUI.md)

Referências:
- https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/
- https://www.tutorialspoint.com/swift/
- Parte deste counteúdo foi baseado no curso gratuito disponível no youtube [Swift Programming Tutorial | FULL COURSE | Absolute Beginner](https://www.youtube.com/watch?v=CwA1VWP0Ldw)