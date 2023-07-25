func atravessar(_ nomes: [String], visitar: (Int,String) -> Void) {
    for (i, nome) in nomes.enumerated() {
        visitar(i,nome)
    }
}

let nomes = ["Anna", "Alex", "Brian", "Jack"]
atravessar(nomes) { pos, nome in
    print("Na posição \(pos) estava '\(nome)'")
}