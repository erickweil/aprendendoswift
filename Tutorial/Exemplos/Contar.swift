// Há várias formas de contar até 10
// Aqui estão algumas

// Utilizando for e intervalos
// irá escrever em cada linha: 1 2 3 4 5 6 7 8 9 10
for i in 1...10 {
    print(i)
}

// irá escrever em cada linha: 0 1 2 3 4 5 6 7 8 9
for i in 0..<10 {
    print(i)
}

// Contando até 10 com while apenas para comparação
var cont = 0
while cont < 10 {
    print(cont)
    cont += 1
}