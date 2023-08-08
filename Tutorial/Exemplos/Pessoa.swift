// Exemplo de classe e Struct

class Pessoa {
    var nome: String
    var idade: Int

    init(_ nome: String, _ idade: Int) {
        self.nome = nome
        self.idade = idade
    }

    func exibir() {
        print("Pessoa \(nome) com \(idade) anos de idade.")
    }
}

var pessoa1 = Pessoa("João",55)
var pessoa2 = Pessoa("Maria",43)

pessoa1.exibir()
pessoa2.exibir()