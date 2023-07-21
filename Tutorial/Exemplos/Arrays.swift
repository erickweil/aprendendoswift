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

// Experimentando adicionar e remover
print("Amtes, Primeiro \(frutas[0]), Último \(frutas[frutas.count-1])")

frutas.append("Pera")
frutas.remove(at:0)

print("Depois, Primeiro \(frutas.first!), Último \(frutas.last!)")

// Encontrar primeiro elemento no array que possui 3 letras
let indice = frutas.firstIndex(where: { $0.count == 3 })
print("Indice:",indice ?? -1," Valor:", frutas[indice ?? 0]) 

// Encontrar todos que começam com a letra M
let frutasM = frutas.filter{ $0.starts(with: "M") }

print("Furtas que começam com M:\(frutasM)")