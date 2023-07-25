// A ideia é escrever código parecendo portugol, mas é swift
func escreva(_ texto: String) {
    print(texto, terminator: "")
}
func escreva(_ n: Int, _ texto: String) {
    print(n, texto, separator: "", terminator: "")
}

func se(_ condicao: Bool, casoVerdadeiro: () -> Void, senao: () -> Void) {
    if(condicao) {
        casoVerdadeiro()
    } else {
        senao()
    }
}

//Abaixo segue código parecido com portugol
escreva("Programa que detecta se número é par ou não \n")

let numero = 5

se(numero % 2 == 0) {
    escreva(numero," É par \n")
} senao: {
    escreva(numero," É ímpar \n")
}