# Optionals

Você pode utilizar *optionals* onde um valor pode não existir. Um Optional representa duas possibilidades: Ou tem um valor, e você pode acessá-lo, ou *não* tem um valor.

> O conceito de Optionals não existe em linguagens como C e Java, O mais próximo disso seria o conceito de retornar null, porém o conceito de null dessas linguagens é a ideia de ser o contrário de uma referência a um objeto, como que "Uma referência inválida". Como a própria ideia já transmite, isto apenas funciona para tipos por referência, Objetos. Em Swift **qualquer** valor pode ser **nil**, não apenas objetos. Você pode ter um **Int?** que é um valor que pode ser tanto **Int** como **nil**

Veja este exemplo onde que optionals podem ser utilizados para lidar com a inexistência de um valor. O tipo Int do Swift tem um inicialiador que converte uma String para Int, porém, nem toda String pode ser convertida para um inteiro. A String "123" pode ser convertida com sucesso para o valor numérico 123, mas a String "Olá Mundo!" não possui uma conversão válida para inteiro.

```swift
let texto = "123"
let numeroConvertido = Int(texto)
// numeroConvertido é do tipo 'Int?'
```

Devido ao fato que a conversão de texto para inteiro pode falhar, este inicializador retorna um **`Int?`** (Inteiro opcional) ao invés de um **`Int`**

Veja que o ponto de interrogação em **`Int?`** faz parte da definição do tipo, indicando que é um **Optional**. Pode conter um valor inteiro ou **nenhum valor**, indicado por **nil**

É interessante notar que na prática, o tipo Optional é um Enum, onde que existem duas possibilidades, o valor ou a inexistência de um valor. Há a definição dessas possibilidades como **.some(valor)** paqra quando há um valor e **.none** para quando é nil


```swift
// Int? e Optional<Int> são equivalentes
let shortForm: Int? = Int("42")
let longForm: Optional<Int> = Int("42")

// Optional.some() produz um optional com valor definido
let hasValue: Int? = Optional.some(42)
// Optional.none produz um optional com nil
let nilValue: Int? = Optional.none
```

## nil

Você pode atribuir uma variável Optional para valor nenhum por atribuir o valor literal especial **nil**

```swift
let respostaDoServidor: Int? = nil
```

> Veja que o valor **nil** só é válido para tipos com ?, indicando a possibilidade de serem **nil**. Em tipos ditos 'normais', não pode receber **nil**, **NEM MESMO OBJETOS**.

## Acessando valor Optional (Unwrapping)

Um tipo Optional não pode ser manuseado da mesma forma que tipos normais. Deve ser convertido para o seu tipo base antes de ser possível manipulá-lo. E isso pode ser feito de várias maneiras:

## **`!` - Forced Unwrapping** 

A forma mais óbvia é utilizar o operador `!`, que força com que o valor Optional seja convertido para o tipo base, **PRODUZINDO UM ERRO CASO SEJA `nil`**

Veja o código abaixo, irá converter o texto "123" para o valor numérico 123
```swift
let texto = "123"
let numero = Int(texto)!
print("Convertido para número é \(numero)")
```

Porém, caso a variável texto não seja um valor numérico válido, a conversão produzirá **nil** e quando o operador **!** tentar converter de **Int?** para **Int** um erro será produzido e o programa encerrado se nenhum tratamento de erro estiver sendo utilizado.

Por isso, é importante utilizar essa conversão forçada apenas quando tiver certeza que não existe a possibilidade do valor ser **nil**, utilizando um if por exemplo:

(As variáveis foram especificadas o Tipo apenas para clareza do exemplo)
```swift
let texto: String = "123"
let possivelNumero: Int? = Int(texto)
if possivelNumero != nil {
    let numero: Int = possivelNumero! // <-- Forced Unwrapping
    print("Convertido para número é \(numero)")
} else {
    print("Não é possível converter '\(texto)' para número")
}
```

Porém, esta forma de verificar com if e então converter fica bastante verbosa e existe outras formas de fazer o mesmo, se ainda é necessário tratar a situação de quando é nil, o correto é utilizar o **if let**

## **if let**
Veja o exemplo abaixo realizando a mesma conversão porém utilizando o if let:
```swift
let texto: String = "123"
if let numero: Int = Int(texto) {
    print("Convertido para número é \(numero)")
} else {
    print("Não é possível converter '\(texto)' para número")
}
```
Veja que quando se utiliza o if let, não é o mesmo que um if normal, se além de verificar que não é nil deseja realizar alguma outra verificação, a sintaxe é colocar a condição após uma **vírgula**. Veja o exemplo abaixo:
```swift
let texto: String = "123"
if let numero: Int = Int(texto), numero >= 0 {
    print("É válido e positivo")
} else {
    print("Não é válido ou não é positivo")
}
```
> Separado por vírgulas também é possível definir vários let que deverão não ser nil

É possível utilizar o if let em uma variável que já foi declarada, fazendo com que dentro deste escopo a variável seja o tipo não optional, sem a necessidade de declarar a variável com outro nome. (Não afeta o escopo pai, apenas dentro do if let)
```swift
let numero: Int? = Int("123")
if let numero {
    // dentro deste escopo numero é do tipo Int (Não é Optional)
    print("\(numero) ao quadrado é \(numero*numero)")
} else {
    print("Não é válido")
}
```

Após tudo isso, veja este exemplo, onde que as variáveis A e B recebem texto lido do usuário, no if let a parte `let A, let B,` garantem que A e B não são nil e então `let numA` e `let numB` garantem que a conversão para inteiro teve sucesso.
```swift
let A: String? = readLine()
let B: String? = readLine()

if let A, let B, let numA = Int(A), let numB = Int(B) {
    print(numA+numB)
} else {
    print("Não é um número válido ou cancelou a escrita")
}
```

## **`??`** - Nil-Coalescing
Veja que com if let o código fica muito mais sucinto e claro. Mas caso a situação de o tipo ser **nil** puder ser ignorada, é possível utilizar o operador *'nil-coalescing'*

Utilize o operador Nil-coalescing (??) para prover um valor padrão que será utilizado quando o Optional for **nil**. Aqui um caminho padrão é definido para uma imagem que pode estar faltando:

```swift
let defaultImagePath = "/images/default.png"
let heartPath = imagePaths["heart"] ?? defaultImagePath
print(heartPath)
```

O operador ?? também funciona com outra instância de Optional encadeado, um depois do outro:

(Neste caso primeiro verifica se a chave "cir" existe, então "squ" e por último vai pro default)
```swift
let shapePath = imagePaths["cir"] ?? imagePaths["squ"] ?? defaultImagePath
print(shapePath)
```

A ideia do ?? é muito parecida com o ou lógico no javascript || , que permite valores default. Veja outro exemplo onde se lê do usuário dois números, atribuindo zero quando um valor inválido é informado:

Veja [Entrada.swift](Exemplos/Entrada.swift)
```swift
// Lendo Números
print("Insira um número para A:")
let A = Int(readLine()!) ?? 0
print("Insira um número para B:")
let B = Int(readLine()!) ?? 0
print("\(A) + \(B) = \(A+B)")
```