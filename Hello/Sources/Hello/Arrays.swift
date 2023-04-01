public struct Arrays {
    public static func test() {

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

        print("Depois, Primeiro \(frutas[0]), Último \(frutas.last!)")

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

        // Encontrar elemento no array
        let indice = frutas.firstIndex(where: { $0.count == 3 })
        print("Indice:",indice ?? -1," Valor:", frutas[indice ?? 0]) 

        // Encontrar todos que começam com a letra M
        let frutasM = frutas.filter{ $0.starts(with: "M") }

        print("Furtas que começam com M:\(frutasM)")


    }
}
