# Operadores e Expressões

Um operador é um símbolo ou palavra que é utilizada para verificar, modificar ou combinar valores. 

A linguagem Swift possuis os operadores que você provavelmente já está acostumado em outras linguagens como C, Java, etc... porém possui várias questões que são adicionadas para evitar erros comuns. Por exemplo o operador = não retorna um valor, para evitar ser utilizado no lugar do == e nenhum erro ser produzido, operadores aritméticos detectam e proíbem o overflow, evitando assim resultados inesperados (como um número ficar de repente negativo após um incremento)

## **Operador de Atribuição**

| Operador   |       Descrição       |
|------------|-----------------------|
| = |  Atribuição, faz a variável à esquerda receber o valor à direita |

No exemplo abaixo, uma variável é declarada com o valor 5 e posteriormente modificada para receber o valor 10
```swift
var a = 5
print(a) // 5
a = 10
print(a) // 10
```

No caso de tuplas, elas podem ser decompostas para atribuir várias variáveis de uma vez
```swift
let (x, y) = (1, 2)
// a variável x recebe 1 e y recebe 2
```

Diferente de Java e outras linguagens, o operador de atribuição não retorna um valor. Veja o exemplo:

```swift
var a = 1
print(a += 1) // Produz (), indicando void
```


## **Operadores Aritiméticos**

| Operador   |       Descrição       |
|------------|-----------------------|
| + |  Soma |
| - |  Subtração |
| * |  Multiplicação |
| / |  Divisão |
| % |  Resto da Divisão |

Veja o exemplo abaixo utilizando os operadores para calcular a média entre dois valores

[Variaveis.swift](Exemplos/Variaveis.swift)
```swift
// Comportamento dos inteiros
let nota1 = 59
let nota2 = 60

let media = (nota1 + nota2) / 2
// Veja que a média ficou com o valor 59 e não 59.5
print("Média de \(nota1) e \(nota2) = \(media)")
```

O operador de soma (+) pode também ser utilizado para concatenar strings.

[Print.swift](Exemplos/Print.swift)
```swift
// Há várias formas de juntar texto com variáveis
// 1. Juntando texto com +
print("O meu nome completo é \""+nome+" "+sobrenome+"\"")
```

**Resto da divisão**

O operador resto da divisão, como em a % b, procura quantos múltiplos de b irão caber dentro de a, e então retorna o que sobrou.

> Em outras linguagens, este operador é chamado de 'módulo', porém em swift devido a seu comportamento com números negativos, é mais como resto da divisão mesmo

Veja um exemplo de como o operador de resto da divisão funciona, convertendo uma quantidade de tempo em segundos para minutos e segundos:

```swift
let totalSegundos = 1000
let minutos = totalSegundos / 60
let segundos = totalSegundos % 60
print("\(minutos) minutos e \(segundos) segundos") 
// 16 minutos e 40 segundos
```

Uma característica do resto da divisão é que um valor nunca passa do limite, por exemplo, para converter entre horas no formato 24 para o formato 12:

```swift
let hora24 = 16
print("Será as \(hora24) horas, \(hora24 % 12) da tarde")
// Será as 16 horas, 4 da tarde
```

**Atribuição Composta**

É possível atribuir valores ao mesmo tempo que aplica uma operação, chamado de atribuição composta.

Veja abaixo as duas formas equivalentes:
```swift
var a = 10

// Incrementar 1, as duas formas funcionam
a = a + 1
a += 1

print(a) // 2
```

> Operadores de atribuição não retornam valor, portanto, você não pode escrever `let b = a += 2`

## **Operadores de Comparação**

| Operador   |       Descrição       |
|------------|-----------------------|
| == |  Igual |
| != |  Diferente |
| < |  Menor |
| > |  Maior |
| <= |  Menor ou igual |
| >= |  Maior ou igual |
| === |  Operador é Idêntico a (Mesma instância da classe) |
| !== |  Operador não é Idêntico a (Não é mesma instância da classe) |

Cada operador de comparação retorna valor lógico `Bool` que indica que a comparação é verdadeira ou não.

```swift
let A = 5
let B = 3
print(A >= B) // true
```

O operador de comparação == compara o conteúdo do texto, diferente de algumas linguagens que é necessário métodos para comparar igualdade do texto:
```swift
let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
// Escreve "hello, world", porque o 'name' é igual a "world".
```

> Mais detalhes sobre operadores lógicos na seção sobre [Condições](Condicoes.md)


## **Precedência de Operadores e Parênteses**

Ás vezes, será necessário utilizar parênteses para que expressões produzam o valor desejado, isto funciona de forma parecida como na maioria das linguagens de programação:

Utilizando parênteses neste exemplo para primeiro somar e então dividir por 2
```swift
let a = 60.0
let b = 75.0
let media = (a + b) / 2.0
print(media)
```

> As precedências e regras de associatividade do Swift se parecem com o padrão de outras linguagens e da matemática, porém são um pouco diferentes de linguagens C-based, tome cuidado e tenha certeza que as expressões executam na ordem desejada. 

## Operadores de Overflow

Se você tentar colocar em uma variável inteira um valor maior do que sua capacidade máxima ou mínima, por padrão o Swift irá produzir um erro ao invés de aceitar este valor inválido. Este comportamento produz maior garantia de segurança caso você trabalhe com números que são muito grandes ou muito pequenos.

Veja o exemplo a seguir onde uma variável **UInt8**, que aceita valores de 0 a 255, recebe 1 a mais:
```swift
var valor: UInt8 = 255
valor = valor + 1 // ERRO
print(valor)
```
Porém é possível **aceitar** o overflow da variável, utilizando os operadores de Overflow:
- Overflow na adição `&+`
- Overflow na subtração `&-`
- Overflow na multiplicação `&*`

```swift
var valor: UInt8 = 255
valor = valor &+ 1
print(valor) // 0
```

Veja o que acontece de forma ilustrada, O valor quando 255 é em binário `11111111`, e somar 1 produz `1 00000000`, que se mantido apenas os últimos 8 bits, é zero
![Imagem](overflowAddition.png)