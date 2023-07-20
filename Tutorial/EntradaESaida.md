# Entrada e Saída

Para escrever na saída de dados se utiliza a função `print`, veja o exemplo abaixo:

[Hello.swift](./Exemplos/Hello.swift)
```swift
print("Olá Swift!")

let a = 1
let b = 2
let c = a + b
print("a + b = \(c)")
// a + b = 3
```

A função `print` recebe como primeiro parâmetro o texto que será escrito, e pode opcionalmente ser especificado mais dois parâmetros, que são `separator` que especifica qual separador será utilizado e `terminator` que é o caractere que será escrito para terminar o print.

Exemplo escrevendo sem pular linha especificando o `terminator`:
```swift
print("Olá", terminator: "")
print(" Tudo", terminator: "")
print(" Bem?") // Só este print irá pular linha
// Olá Tudo Bem?
```

> Na linguagem Swift, funções podem conter tanto parâmetros posicionais como parâmetros nomeados, podendo estes ser opcionais. Veja [Funções](Funcoes.md) para mais detalhes

**Interpolação de Texto**

A linguagem Swift utiliza de interpolação de texto para incluir variáveis ou constantes dentro de um texto. no exemplo veja que em `"a + b = \(c)"` o valor da variável **c** é inserida dentro do texto.

Esta inclusão da variável no texto pode ocorrer várias vezes, basta incluir dentro de `\()`
```swift
let nome = "James"
let sobrenome = "Bond"
print("Meu nome é \(sobrenome), \(nome) \(sobrenome)")
// Meu nome é Bond, James Bond
```

Dentro dos parênteses é como uma expressão comum da linguagem, e pode se realizar cálculos, chamar funções, etc...

Veja este exemplo onde se calcula dentro da interpolação de texto
```swift
let segundos = 200.0
print("\(segundos) segundos são \(segundos/60.0) minutos")
// 200.0 segundos são 3.3333333333333335 minutos
```

> Expressões dentro da string interpolada não pode conter `\` nem quebras de linha.

> É possível especificar delimitadores extendidos para escrever uma string sem ser afetada por essas regras: 
>
> `print(#"pode colocar \(isso aqui sem problemas)"#)`

