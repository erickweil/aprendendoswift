# Condições

A Linguagem Swift possui uma boa variedade de formas de implementar controle de fluxo, if, swift, while, for, if let, guard, etc...

## If
Como em outras linguagens, executa um trecho de código apenas se certa condição é verdadeira

> Veja [BolachaOuMaca.swift](Exemplos/BolachaOuMaca.swift)

```swift
let velocidade = 130
let maximo = 80
if velocidade > maximo {
    print("Você está acima da velocidade máxima")
}
```

Veja que a condição não precisa ficar dentro de parênteses, e caso queira que outro trecho de código execute quando a condição é falsa, basta adicionar o bloco else

Veja por exemplo este programa que verifica se um número é par ou ímpar
```swift
let numero = 11
if numero % 2 == 0 {
    print("\(numero) é par")
} else {
    print("\(numero) é impar")
}
```

Caso queira encadear várias condições, pode-se utilizar `else if` e ir colocando várias condições aninhadas.

Veja este exemplo que verifica se um número é positivo, negativo ou igual a zero:
```swift
let numero = 11
if numero > 0 {
    print("\(numero) é maior que zero")
} else if numero < 0 {
    print("\(numero) é menor que zero")
} else {
    print("\(numero) é igual a zero")   
}
```

## Guard e Early-Exit

Enquanto o if possui obrigatoriedade no caso verdadeiro e opcionalmente é necessário especificar o caso falso com else, o **guard** possui o caso falso, else, obrigatoriamente.

A sintaxe geral é:
```swift
guard expressao else {
    // o que fazer quando falhar
    // término do fluxo: return, break, continue ou throw.
}
```
> É obrigatório possuir um return, break, continue ou throw para sair do escopo do guard

O guard faz bastante sentido em funções quando se deseja encerrá-las de forma precoce quando algo de errado é detectado, chamado Early-Exit.

Exemplo:
```swift
func dadosValidos(nome: String?, idade: Int?) -> Bool {
    guard let nome, let idade, idade >= 18 else {
        print("Dados inválidos")
        return false
    }
    // nome e idade não são Optionals mais
    print("Nome: \(nome), idade: \(idade)")
    return true
}
```

Vantagens do guard ao invés do if:
- Fica claro o que seu código está tentando fazer. Ao invés de dizer o que você não quer, você dizer exatamente o que você quer
- Torna mais fácil lidar com opcionais por realizar o unwrapping deles e terminar a execução caso seja nil
- Reduz a quantidade de linhas de código

## Switch

Em Swift, o Switch é muito poderoso. É possível realizar muitas coisas com ele. Primeiro vamos ao uso padrão do switch: lidar com várias opções

```swift
let direcao: Character = "N"
switch direcao {
    case "N": print("Norte")
    case "S": print("Sul")
    case "L": print("Leste")
    case "O": print("Oeste")
    default:
        print("Não é uma das direções cardeais")
}
```

O switch é equivalente a vários if else encadeados, porém escrito de uma forma mais sucinta e fácil de ler. Veja no exemplo acima que há quatro direções possíveis: N, S, L e O. caso o caracter não seja nenhuma dessas, será executado o caso default, *que deve sempre ser especificado por último*

> Existe uma característica de que um switch deve ser exaustivo. Isto é, ou todas as possibilidades devem ser testadas com case, ou é obrigatório a existência do caso default para quando não é nenhum dos casos.

**Falltrough não é implícito, não precisa de break**

Diferente de C e Java, o switch não é falltrough, isto é, um caso não passa para o próximo na falta do break. Assim que a execução de um caso chega ao fim o switch encerra sem executar nenhum outro caso.

> Ainda é possível utilizar falltrough de forma explícita utilizando a palavra reservada `falltrough`, porém raros são os casos que isto é necessário

Por isso, utilizar o break é opcional. (ainda é possível colocar break para sair de um caso antes dele terminar)

Mas então vem a pergunta, como considerar vários casos que possuem o mesmo corpo? o switch no Swift resolve isso de forma mais clara e com menos chances de confusão. Veja o mesmo código porém aceitando tanto maiúsculas como minúsculas:

```swift
let direcao: Character = "N"
switch direcao {
    case "n", "N": print("Norte")
    case "s", "S": print("Sul")
    case "l", "L": print("Leste")
    case "o", "O": print("Oeste")
    default:
        print("Não é uma das direções cardeais")
}
```

Veja este outro exemplo onde se testa se uma letra minúscula é vogal ou consoante:
```swift
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) é uma vogal")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) é uma consoante")
default:
    print("\(someCharacter) não é nem vogal nem consoante")
}
```

### Intervalos

Valores em casos do switch podem ser verificados quanto à serem participantes de um intervalo. Veja este exemplo de cálculo de IMC por exemplo:

Veja [IMC.swift](Exemplos/IMC.swift)
```swift
let peso = 85.0
let altura = 1.85

let imc = peso / (altura * altura)

print("O IMC calculado foi \(imc)")
switch imc {
case 0..<18.5:
    print("Abaixo do peso")
case 18.5..<25:
    print("Saudável")
case 25..<30:
    print("Peso em Excesso")
case 30..<35:
    print("Obesidade I")
case 35..<40:
    print("Obesidade II")
default:
    print("Obesidade III")
}
```