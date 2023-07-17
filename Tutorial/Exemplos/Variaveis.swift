// Comportamento dos inteiros
let nota1 = 59
let nota2 = 60

let media = (nota1 + nota2) / 2
// Veja que a média ficou com o valor 59 e não 59.5
print("Média de \(nota1) e \(nota2) = \(media)")

let cateto = 3.0
let cateta = 4.0

let hipote = (cateto * cateto + cateta * cateta).squareRoot()

print("Hipotenusa = \(hipote)")

// 'var' quando precisa mudar de valor
var i: Int = 0

print("----------------------")
print("Comportamento do i+=1")
print("Antes: \(i)")
print("Durante: \(i+=1)") // não tem i++, e i += 1 retorna void
print("Depois:\(i)")
