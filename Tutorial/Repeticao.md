# Repetição

A repetição na linguagem Swift é parecida com outras linguagens, porém consegue ser mais simples quando lidando com intervalos e iteração em listas.

## For in

Veja o exemplo mais simples possível, contar até 10:

Veja [Contar.swift](Exemplos/Contar.swift)
```swift
// Utilizando for e intervalos
// irá escrever em cada linha: 1 2 3 4 5 6 7 8 9 10
for i in 1...10 {
    print(i)
}
```

A sequência criada por `1...10` é os números de 1 a 10 incluindo 1 e 10, caso queira que não inclua o último, utilize `1..<10` que produz a sequência de 1 a 9, não inclui o 10.

```swift
// irá escrever em cada linha: 0 1 2 3 4 5 6 7 8 9
for i in 0..<10 {
    print(i)
}
```

Também é possível iterar sobre um array, considere o exemplo atravessando nomes de um array:
```swift
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!
```

Veja este exemplo onde se itera sobre as letras de um texto, cada letra de é atravessada e escrita uma por linha:
```swift
let texto = "Exemplo"
for caractere in texto {
    print(caractere)
}
// E
// x
// e
// m
// p
// l
// o
```

## While

Além do For in, em swift você pode utilizar while da mesma forma que em outras linguagens:
```swift
// Contando até 10 com while apenas para comparação
var cont = 0
while cont < 10 {
    print(cont)
    cont += 1
}
```

## Repeat While
Repeat while é equivalente ao do-while em C e Java. A ideia é que irá executar uma vez sempre, e então apenas irá repetir enquanto for verdadeiro. Veja um exemplo:

[Historia.swift](Exemplos/Historia.swift)
```swift
var resposta: String?
repeat {
    print("Era uma vez uma zebra xadrez, deseja ouvir outra vez?")
    resposta = readLine()
} while resposta != nil && resposta! == "sim"
```