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

Para mais exemplos veja 
Veja [Print.swift](Exemplos/Print.swift)
## Entrada de dados

É possível receber dados do usuário quando executando um programa via terminal. Para isso se utiliza a função `readLine` que retorna o tipo `String?`, que representa que pode ser uma **String** ou **nil**

> Deve-se notar que como é possível que o valor lido seja **nil**, o retorno da função ReadLine é um **Optional**, sendo necessário o **!** ou **if let** para convertê-lo para um valor.

Veja [Entrada.swift](Exemplos/Entrada.swift)
- Forma 1
```swift
print("Insira um texto e aperte Enter:")
if let line = readLine() {
    print("A linha lida foi:\(line)")
} else {
    print("Nada foi escrito")
}
```

- Forma 2 (Causa erro caso cancele a escrita com ctrl+D ou outro jeito)
```swift
print("Insira um texto e aperte Enter:")
let line = readLine()!
print("A linha lida foi:\(line)")
```

- Forma 3 (Com valor default texto vazio)
```swift
print("Insira um texto e aperte Enter:")
let line = readLine() ?? ""
print("A linha lida foi:\(line)")
```

Para ler valores numéricos é necessário converter a String para o tipo desejado:
```swift
// Lendo Números
print("Insira um número para A:")
let A = Int(readLine()!) ?? 0
print("Insira um número para B:")
let B = Int(readLine()!) ?? 0
print("\(A) + \(B) = \(A+B)")
```
> Veja a seção convertendo texto para número em [Variáveis.md](Variaveis.md)