// Convertendo valores
let distanciaKM = 1000.0
let velocidadeKMH = 120.0

let tempo = distanciaKM / velocidadeKMH

let horas = Int(tempo)
let minutos = Int((tempo - Double(horas)) * 60.0)

print("Para percorrer \(distanciaKM) km à \(velocidadeKMH) km/h irá demorar:")
print("\(horas) horas e \(minutos) min")