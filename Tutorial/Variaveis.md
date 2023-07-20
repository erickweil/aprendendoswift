**Variáveis e Constantes**

Quando se declara variáveis com a palavra `var` ela será uma variável que permite modificar seu valor, porém se for declarada com `let`, será criada uma constante, e uma vez definido seu valor, não poderá mudar seu valor.

```swift
let darkMode = true

darkMode = false // ERRO!
```

> Veja que não se utiliza `;` (Ponto e vírgula). Na verdade a utilização do ponto e vírgula é permitida, porém não é obrigatória (Apenas é necessário se quiser incluir várias instruções na mesma linha).

O exemplo acima demonstra que modificar o valor de uma constante produz um erro de compilação, pois não é permitido mudar o seu valor. Então se for necessário trocar o seu valor, deve ser declarado com `var`:

```swift
var darkMode = true

darkMode = false // OK...
```

> Nos exemplos poderão ser utilizados comentários para exemplificar a saída ou explicar o código. em Swift comentários podem ser comentários de linha com `//` ou comentários de bloco, iniciando com `/*` e terminando com `*/`

É possível ter várias declarações na mesma linha, separado por vírgulas, como segue:
```swift
var x = 0.0, y = 0.0, z = 0.0
```

> Constantes são utilizadas para impedir que 'sem querer' uma variável seja modificada e cause bugs no seu código por modificar uma variável que em teoria não deveria ser modificada.

> Sempre que o valor de uma variável não for modificado no código, dê preferência a declará-lo como uma constante

## Tipos
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

> São raras as situações onde a anotação do tipo, isto é, especificar de fato o tipo da variável se torna necessário. O Swift consegue na maioria das vezes inferir qual é o tipo da variável ou constante que está sendo declarada.

> Dê preferência a declarar sem especificar a anotação do tipo, para um código mais limpo e de fácil leitura, especificando os tipos apenas quando necessário

## Nomeando constantes e variáveis

Nomes de constantes e variáveis podem conter quase qualquer caractere, incluindo caracteres unicode.
```swift
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "cachorrovaca"
```
Porém, constantes e variáveis não podem conter caracteres de espaçamento, símbolos matemáticos, setas, certos caracteres unicode, e também não pode começar com números, apenas pode conter números após o primeiro caractere.

> Caso o nome de uma variável for uma palavra reservada do swift, é possível encasular seu nome dentro de crase (```), porém isto deve ser evitado


## Entendendo melhor os Tipos

**Inteiros**

Inteiros são números sem casas decimais, como 42 e -23. Além disso há variante sem sinal, número que só pode ser positivo.

Na linguagem Swift é possível declarar inteiros com e sem sinal dos tamanhos 8, 16, 32 e 64 bits. A nomenclatura é parecida com C

- 8 Bits: Int8
- 16 Bits: Int16
- 32 Bits: Int32
- 64 Bits: Int64

Quando quiser inteiro sem sinal, especifica-se com U, sendo UInt8, UInt16, UInt32 e UInt64.

O padrão quando se especifica o tipo sem especificar o número de bits como em Int ou UInt é que o tipo terá o mesmo número de bits que a plataforma em que está, então num sistema 32 bits terá 32 bits e em um sistem 64 terá 64.

> A não ser que precise de um tamanho específico de inteiro, prefira declarar como **Int**, sem colocar o tamanho.

> **UInt** só deve ser utilizado em situações específicas onde é necessário interoperar com bibliotecas que o exigem. É mais consistente sempre utilizar Int, mesmo que não seja utilizado números negativos, pois evita conversões desnecessárias.

> Quando se declara uma variável sem especificar o tipo, como em `var a = 1` ela será do tipo **Int**

**Ponto Flutuante**

Números ponto flutuante são os que contém casas decimais, como 3.14159, 0.1 e -273.15

Há dois tipos para números ponto flutuante:
- Float - 32 bits, precisão de 6 casas decimais
- Double - 64 bits, precisão de 15 casas decimais

> Prefira utilizar Double sempre que precisar de números com casas decimais, já que possui maior precisão. Expressões entre valores Double e Float resultarão em um valor Double

> Quando o tipo for inferido como em `var b = 3.14` a variável será **Double**

**Conversão de tipos**

É possível converter um tipo para outro especificando o nome do tipo como se fosse uma função. Veja no exemplo abaixo uma variável ponto flutuante sendo convertida para inteiro e vice-versa:

[Conversao.swift](Exemplos/Conversao.swift)
```swift
// Convertendo valores
let distanciaKM = 1000.0
let velocidadeKMH = 120.0

let tempo = distanciaKM / velocidadeKMH

let horas = Int(tempo)
let minutos = Int((tempo - Double(horas)) * 60.0)

print("Para percorrer \(distanciaKM) km à \(velocidadeKMH) km/h irá demorar:")
print("\(horas) horas e \(minutos) min")
```

Neste exemplo se observa a utilização da conversão de **Double** para **Int**, de forma que as casas decimais são eliminadas, permitindo assim extrair as horas e os minutos a partir de um único valor fracionário.

