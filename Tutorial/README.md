# Hello
Este roteiro tem como objetivo guiar pelo processo de como funciona a linguagem swift de forma geral, sendo um bom ponto de partida para seu aprendizado. 

Parte deste counteúdo foi baseado no curso gratuito disponível no youtube [Swift Programming Tutorial | FULL COURSE | Absolute Beginner](https://www.youtube.com/watch?v=CwA1VWP0Ldw)

## Introdução à Swift
![Logo](https://developer.apple.com/swift/images/swift-logo.svg)

Antes de começarmos a programar, é importante saber o que é a linguagem Swift e da onde ela veio.

A linguagem Swift é uma linguagem relativamente nova, [foi anunciada no WWDC em 2014](https://www.youtube.com/watch?v=MO7Ta0DvEWA) como uma substituição ao Objective-C, sendo Swift um Objective-C sem a 'complicação' do C

É uma linguagem com várias características de linguagens compiladas, possuindo forte tipagem e produzindo erros de compilação (aqueles que aparecem antes mesmo do código ser executado) Mas ao mesmo tempo características como inferência de tipos e funções como tipos que podem ser passados como se fossem variáveis o que torna a linguagem bastante versátil.

Nos últimos anos Swift mudou bastante, a maioria das mudanças aconteceram nos primeiros anos, em 2015 com Swift 2.0 se tornou uma linguagem [Open Source](https://www.swift.org/) permitindo colaboração da comunidade.

Em 2016 Swift 3.0 foi lançado e muito da linguagem mudou, sendo chamado de 'A Grande Renomeação'. Provavelmente pesquisas antigas, de antes de 2016, irão dar resultados de código swift que não funciona nas versões mais recentes.

As mudanças então foram desacelerando e 2017 foi lançado swift 4.0, em 2018 swift 4.2, e hoje estamos no swift 5.8.1 e não há previsão exata de quando uma nova versão será lançada

## Instalação

Veja o arquivo dedicado **FALTA O LINK AQUI**, mas basicamente:

- Se você está no MacOS, basta instalar o XCode.
- Se você está no Linux ou Windows, veja as instruções na seção [Getting Started](https://www.swift.org/getting-started/) do swift.org
  
# Linguagem Swift
A linguagem Swift é uma linguagem fortemente tipada, e como esta definição sugere, **tipos** são algo importante nesta linguagem.

**Números na linguagem Swift**:
- **Int** &emsp;&emsp;&emsp; Número inteiros
- **Float** &emsp;&emsp;  Números com casas decimais com precisão até a 6º casa
- **Double** &emsp; Números com casas decimais com precisão até a 15º casa

Por exemplo, se você está armazenando o número da página atual, poderia ser declarado assim esta variável inteira:
```swift
var pagina: Int = 0
```
Já uma porcentagem indicando 60% do progresso de um download:
```swift
var porcentagem: Float = 0.6
```

**Texto**:

O texto é representado pelo tipo **String**, que funciona de forma muito parecida com qualquer outra linguagem de programação:
```swift
var tituloPagina: String = "Porquê o texto seria diferente?"
```

**Lógico**:
O tipo lógico é o Bool. Aceita valores verdadeiro `true` e falso `false`
```swift
var darkMode: Bool = true
```

**Inferência de tipos**

Os exemplos acima mostram a criação de variáveis informando por completo o nome, tipo e valor, porém não é obrigatório especificar o tipo da variável caso ela seja criada com um valor de um tipo definido, o tipo da variável é **inferido** em tempo de compilação de acordo com o tipo do valor que for atribuído.

Portanto, pode-se muito bem declarar a variável da seguinte forma:
```swift
var pagina = 0
var porcentagem = 0.6
var tituloPagina = "Porquê o texto seria diferente?"
var darkMode = true
```
E as variáveis terão seus tipos normalmente do mesmo jeito como quando são explicitamente tipadas.

**Constantes**

Quando se declara variáveis com a palavra `var` ela será uma variável que permite modificar seu valor, porém se for declarada com `let`, será criada uma constante, e uma vez definido seu valor, não poderá mudar seu valor.

```swift
let darkMode = true

darkMode = false // ERRO!
```

O exemplo acima demonstra que modificar o valor de uma constante produz um erro de compilação, pois não é permitido mudar o seu valor. Então se for necessário trocar o seu valor, deve ser declarado com `var`:

```swift
var darkMode = true

darkMode = false // OK...
```

> Constantes são utilizadas para impedir que 'sem querer' uma variável seja modificada e cause bugs no seu código por modificar uma variável que em teoria não deveria ser modificada.

## Arrays
Arrays permitem armazenar dados sequenciais de forma que seja possível acessar cada elemento pelo valor de seu índice.
![Array.png](Array.png)

Para criar um Array em Swift, se utiliza o símbolo [] (Colchetes). Veja o exemplo abaixo de um array de String:
```swift
var nomes: [String] = ["João","Maria","Humberto","Ana"]
```
É possível acessar certos atributos de um array que contém informações relevantes:
```swift
nomes[0]     // --> "João"
nomes[2]     // --> "Humberto"
nomes.count  // --> 4      tem 4 elementos no array
nomes.first! // --> "João" O primeiro elemento do array é João
nomes.last!  // --> "Ana"  O último elemento do array é Ana
```
> O ponto de exclamação em `.first` e `.last` é necessário para converter de opcional para o seu valor, pois o retorno destas propriedades pode ser o valor nulo **nil**. Mais para frente será explicado o que são Opcionais detalhadamente.

**Métodos em arrays**

Arrays em swift não são fixos em seu tamanho e podem ser manipulados quase como acontece em linguagens como javascript e python, onde na verdade o array se redimensiona automaticamente dobrando sua capacidade para acomodar novos elementos.

**append** - Permite adicionar elementos ao final de um array
```swift
var idades: [Int] = [66,23]
idades.append(88)
idades.append(99)

print(idades) // ->  [66,23,88,99]
```

**insert** - Permite adicionar elementos em uma posição específica do array
```swift
var idades: [Int] = [66,23]
idades.insert(88, at: 0)
idades.insert(99, at: 0)

print(idades) // ->  [99,88,66,23]
```
> Veja que para especificar a posição que irá ser inserido, se especifica o parâmetro utilizando `at:`, funções em swift podem possuir tanto parâmetros posicionais como parâmetros nomeados, parecido com python

**sort** - Para ordenar o conteúdo do array
```swift
var numeros: [Int] = [4,7,2,8]
numeros.sort()
print(numeros) // ->  [2,4,7,8]
```

**reverse** - Para inverter a ordem do conteúdo do array
```swift
var numeros: [Int] = [4,7,2,8]
numeros.reverse()
print(numeros) // ->  [8,2,7,4]
```

**shuffle** - Para bagunçar um array aleatoriamente
```swift
var numeros: [Int] = [4,7,2,8]
numeros.shuffle()
print(numeros) // ->  [2,4,8,7] (Cada vez que executar será diferente)
```

.