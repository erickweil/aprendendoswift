public struct Arrays {
    public static func test() {
        print("Teste Arrays\n")

        var frutas = [
        "Maçã vermelha",
        "Banana",
        "Uva",
        "Laranja",
        "Morango",
        "Abacaxi",
        "Melancia",
        "Cereja",
        "Kiwi",
        "Pêssego"
        ]

        print("Primeiro \(frutas[0]), Último \(frutas[frutas.count-1])")

        frutas.append("Pera")
        frutas.remove(at:0)

        print("Depois, Primeiro \(frutas[0]), Último \(frutas[frutas.count-1])")

        let mapafrutas = [
            "🍎":"Maçã vermelha",
            "🍌":"Banana",
            "🍇":"Uva",
            "🍊":"Laranja",
            "🍓":"Morango",
            "🍍":"Abacaxi",
            "🍉":"Melancia",
            "🍒":"Cereja",
            "🥝":"Kiwi",
            "🍑":"Pêssego"
        ]

        // Acesso ao dicionário, prover default para quando não encontra a chave
        print(mapafrutas["🍒", default: "Não encontrado"])
        print(mapafrutas["🍐", default: "Não encontrado"])
    }
}
