let peso = 85.0
let altura = 1.85

let imc = peso / (altura * altura)

print("O IMC calculado foi \(imc)")
switch imc {
case 0..<18.5:
    print("Abaixo do peso")
case 18.5..<25:
    print("Saudável")
case 25..<30:
    print("Peso em Excesso")
case 30..<35:
    print("Obesidade I")
case 35..<40:
    print("Obesidade II")
default:
    print("Obesidade III")
}