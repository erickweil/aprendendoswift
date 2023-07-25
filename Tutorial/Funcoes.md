# Funções

Funções são pedaços de código auto-contidos que executam determinada tarefa. Você dá a uma função um nome que identifica o que ela faz, e esse nome é utilizado para "chamar" a função para fazer a sua tarefa quando necessário

A sintaxe do Swift de como funções são definidas é flexível o suficiente para expressar qualquer coisa desde funções simples estilo C até funções complexas que aceitam parâmetros nomeados, parâmetros opcionais com valores default, e um tratamento de callbacks bastante especial.

Toda função em Swift possui um tipo, consistindo do conjunto dos tipos dos parâmetros e seu tipo de retorno. Uma variável pode ser criada para guardar uma função e funções podem ser passadas como parâmetros parecido como acontece em JavaScript, Python entre outras.

## Definindo e chamando Funções

Vamos começar pelo exemplo mais simples possível, uma função que apenas diz Olá e mais nada:

```swift
func bemVindo() {
    print("Seja Bem Vindo!")
}

bemVindo()
```

Todas função possui um nome, que a identifica. Para utilizar uma função você "chama" a função pelo nome, e ela será executada
### Parâmetros

É possível passar passar Parâmetros a uma função, de forma que ela faça algo com os valores passados. Veja no exemplo abaixo uma função que recebe um nome ao qual dizer bem vindo:

```swift
func bemVindo(nome: String) {
    print("Seja Bem Vindo \(nome)!")
}

bemVindo(nome: "João")
// Seja Bem Vindo João!
```

Veja que por padrão, ao chamar a função é necessário especificar o nome do parâmetro que deseja passar (Argument Label), Vários parâmetros podem ser especificados (porém é importante seguir a ordem que foram declarados). Veja o exemplo abaixo com dois parâmetros.

```swift
func bemVindo(nome: String, sobrenome: String) {
    print("Seja Bem Vindo \(nome) \(sobrenome)!")
}

bemVindo(nome: "João", sobrenome:"Silva")
// Seja Bem Vindo João Silva!
```

### Rótulos de Parâmetros
Cada parâmetro de uma funão possui tanto um rótulo de *argumento* e nome de *parâmetro*. O Rótulo de argumento é utilizado ao chamar a função, Cada argumento é escrito na chamada da função com seu rótulo antes (nome: "João"). Já o nome de parâmetro é utilizado na implementação da função, é a variável que contém o valor passado. 

Por padrão, o nome de parâmetro é o mesmo que o rótulo de argumento. Porém é possível especificar um rótulo de argumento diferente, para que a chamada da função fique mais legível e expressiva, como se fosse uma 'conversa'

Ok, vamos comparar as duas formas e você verá a diferença:

**Normal (Rótulo de argumento == Nome de Parâmetro)**
```swift
func bemVindo(nome: String, cidade: String) {
    print("Seja Bem Vindo \(nome)! então você veio de \(cidade)...")
}

bemVindo(nome: "João", cidade: "Cascavel")
```

**Utilizando Rótulo (Rótulo de argumento != Nome de Parâmetro)**
```swift
func saudacoes(para nome: String,de cidade: String) {
    print("Seja Bem Vindo \(nome)! então você veio de \(cidade)...")
}

saudacoes(para: "João", de: "Cascavel")
```

Veja que o rótulo é uma forma de tornar a chamada da função mais clara e legível, porém sem perder o sentido na implementação da função pois ainda se utilizará nomes que fazem sentido para as variáveis.

### Omitindo Rótulos de Parâmetros
É possível definir a função de forma que o nome de alguns parâmetros não precisem ser especificados, (isto seria o padrão em outras linguagens)

Para omitir o rótulo de um parâmetro, basta declarar o parâmetro com underline (_) em vez de um rótulo. Desta forma não será necessário especificar o nome do rótulo ao passar o parâmetro da função.
```swift
func bemVindo(_ nome: String,de cidade: String) {
    print("Seja Bem Vindo \(nome)! então você veio de \(cidade)...")
}

bemVindo("João", de: "Cascavel")
```

> Veja que por padrão é **obrigatório** especificar o rótulo ao chamar a função. Apenas não é necessário caso na declaração da função esteja como acima, com _ no rótulo.

### Parâmetros opcionais, com valores padrão

Você pode definir um valor padrão (default) para qualquer parâmetro em uma função por atribuir um valor em sua declaração. Caso o valor padrão seja especificado para um parâmetro, ele será opcional na chamada da função
```swift
func bemVindo(_ nome: String,de cidade: String = "Vilhena") {
    print("Seja Bem Vindo \(nome)! então você veio de \(cidade)...")
}

bemVindo("João")
// Seja Bem Vindo João! então você veio de Vilhena...
```

> Sempre coloque parâmetros que são opcionais depois dos obrigatórios.

### Parâmetros Variáveis (Variadic)

Um parâmetro variável aceita zero ou mais valores de um tipo especificado. Você utiliza parâmetro variável para especificar que o parâmetro pode ser passado como vários valores ao chamar a função. Para especificar um parâmetro variável utilize ... após a declaração do parâmetro.

```swift
func media(_ numeros: Double...) -> Double{
    var total = 0
    for n in numeros {
        total += n
    }
    return total / Double(numeros.count)
}

print(media(1, 2, 3, 4, 5))
// 3.0
```

## Retorno
Funções podem produzir retorno, que é um valor que é produzido pela função e retornado para quem a chamou.

O exemplo abaixo exemplifica uma função que soma dois número e os retorna:
```swift
func soma(_ a: Int, _ b: Int) -> Int{
    return a + b
}

let res = soma(1,2)
print(res)
// 3
```

Veja que o tipo de retorno é especeificado após os parênteses em `-> Int`

O tipo da expressão após a palavra reservada return deve corresponder com o tipo declarado que a função irá retornar. Além disso, em funções com vários caminhos possíveis devido ao uso de condições e repetição, deve haver um return para cada possível caminho que o código possa seguir.

> Inclusive, uma função assim tão simples nem precisa da palavra return, 
> A função abaixo é equivalente acima:
> ```swift
> func soma(_ a: Int, _ b: Int) -> Int{
>     a + b
> }
> ```
> Isto apenas é possível quando o inteiro corpo da função é uma única expressão. Se houvesse mais instruções o return é necessário.

Quando uma função possui retorno é lançada uma *warning* caso não seja utilizado o valor retornado, a forma correta de ignorar o valor retornado de uma função é por utilizar o _

Veja no exemplo abaixo:
```swift
func escrevaRetornando(_ texto: String) -> String{
    print(texto)
    return texto
}

let t = escrevaRetornando("Guardou em t")
let _ = escrevaRetornando("Ignorou o retorno")
```

### Retornar vários valores

Uma função pode retornar uma **Tupla** de valores, de forma que fica bastante fácil lidar com vários retornos. Veja abaixo uma função que troca duas variáveis:

```swift
func trocar(_ a: Int, _ b: Int) -> (Int, Int) {
    return (b, a)
}

var a = 5
var b = 7

print("Antes:")
print("A:\(a)")
print("B:\(b)")

(a, b) = trocar(a, b)

print("Depois:")
print("A:\(a)")
print("B:\(b)")
```

## Funções como tipos

Uma função é um tipo como qualquer outro em Swift. O tipo de uma função depende dos tipos de seus parâmetros e do tipo de retorno da função. Veja alguns exemplos de funções e seus tipos:

```swift
// Tipo () -> Void
func bemVindo() {
    print("Seja Bem Vindo!")
}

// Tipo (String, String) -> Void
func saudacoes(para nome: String,de cidade: String) {
    print("Seja Bem Vindo \(nome)! então você veio de \(cidade)...")
}

// Tipo (Int, Int) -> Int
func soma(_ a: Int, _ b: Int) -> Int{
    return a + b
}

// Tipo (Int, Int) -> (Int, Int)
func trocar(_ a: Int, _ b: Int) -> (Int, Int) {
    return (b, a)
}
```

### Utilizando Funções como tipos

É possível definir uma variável que recebe uma função como seu valor, e então chamar a variável para executar a função.

Veja neste exemplo a função soma sendo armazenada em uma variável e chamada:

```swift
func soma(_ a: Int, _ b: Int) -> Int{
    return a + b
}

func mult(_ a: Int, _ b: Int) -> Int{
    return a * b
}

var calculo: (Int, Int) -> Int

calculo = soma
print(calculo(3,3))
// 6

calculo = mult
print(calculo(3,3))
// 9
```

### Funções como parâmetros

É possível passar uma função como parâmetro de outra função, declarando o parâmetro o tipo que ele espera de função.

```swift
func atravessar(_ nomes: [String], visitar: (Int,String) -> Void) {
    for (i, nome) in nomes.enumerated() {
        visitar(i,nome)
    }
}

func funcaoVisita(_ pos: Int, _ nome: String) {
    print("Na posição \(pos) estava '\(nome)'")
}

let nomes = ["Anna", "Alex", "Brian", "Jack"]
atravessar(nomes, visitar: funcaoVisita)
```

É interessante notar que no caso de funções como parâmetros, é possível passar uma **closure**, que é como uma função criada como uma expressão, e não precisa então da criação da funcaoVisita. Veja como fica:
```swift
func atravessar(_ nomes: [String], visitar: (Int,String) -> Void) {
    for (i, nome) in nomes.enumerated() {
        visitar(i,nome)
    }
}

let nomes = ["Anna", "Alex", "Brian", "Jack"]
atravessar(nomes, visitar: { pos, nome in
    print("Na posição \(pos) estava '\(nome)'")
})
```

A sintaxe é um pouco estranha, vamos esclarecer...

Para definir uma closure, é utilizado a sintaxe:
```
{ ( <parâmetros> ) -> <retorno> in
    <código>
}
```

Então uma closure para o exemplo acima seria:
```
{ (pos: Int, nome: String) -> Void in
    <código>
}
```

Porém não é necessário especificar os parâmetros da closure explicitamente quando a mesma é passada como argumento de uma função, pois é possível inferir o tipo dos parâmetros, por isso a sintaxe fica:
```
{ pos, nome in
    <código>
}
```
> Veja que os parâmetro são definidos **dentro** das chaves, Além disso, caso não tenha nenhum parâmetro não é necessário a palavra reservada **in**

### Trailing Closures 
É bastante comum quando um método possui uma closure como último argumento, colocálo como um **Trailing Closure** para facilitar a leitura do código. Basicamente é uma sintaxe que permite passar a closure com um par de chaves **após** a chamada do método.

Veja abaixo o exemplo anterior neste formato:
```swift
func atravessar(_ nomes: [String], visitar: (Int,String) -> Void) {
    for (i, nome) in nomes.enumerated() {
        visitar(i,nome)
    }
}

let nomes = ["Anna", "Alex", "Brian", "Jack"]
atravessar(nomes) { pos, nome in
    print("Na posição \(pos) estava '\(nome)'")
}
```

Veja que fica muito mais claro e fácil de escrever o código passando closures desta forma.

Veja um exemplo onde que se utiliza desta sintaxe para criar um código que parece portugol mas é swift válido:

```swift
// A ideia é escrever código parecendo portugol, mas é swift
func escreva(_ texto: String) {
    print(texto, terminator: "")
}
func escreva(_ n: Int, _ texto: String) {
    print(n, texto, separator: "", terminator: "")
}

func se(_ condicao: Bool, casoVerdadeiro: () -> Void, senao: () -> Void) {
    if(condicao) {
        casoVerdadeiro()
    } else {
        senao()
    }
}

//Abaixo segue código parecido com portugol
escreva("Programa que detecta se número é par ou não \n")

let numero = 5

se(numero % 2 == 0) {
    escreva(numero," É par \n")
} senao: {
    escreva(numero," É ímpar \n")
}
```