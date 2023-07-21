print("Você está com fome, escolha o que irá comer:")
print("1 - Bolacha")
print("2 - Maçã")

var resposta: String

resposta = readLine() ?? "1"
if resposta == "1" {
    print("Deseja tomar a bolacha com leite?")
    print("1 - Sim, com leite")
    print("2 - Não")
    resposta = readLine() ?? "1"
    if resposta == "1" {
        print("A bolacha derrete e virou mingau.")
    } else {
        print("é isso aí, 😎.")
    }
} else {
    print("Irá descascar a Maçã?")
    print("1 - Sim")
    print("2 - Não")
    resposta = readLine() ?? "1"
    if resposta == "1" {
        print("Você cortou o dedo.")
    } else {
        print("A maçã estava ótima.")
    }
}