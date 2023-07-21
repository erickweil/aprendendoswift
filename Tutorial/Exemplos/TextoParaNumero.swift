// Existem três formas para lidar com o Int?

// 1. Utilizando if let
let texto = "123"
if let numero = Int(texto) {
    print("Convertido para número é \(numero)")
} else {
    print("Erro na conversão de texto para número")
}

// 2. Utilizando ! (Produz erro se não for válido)
let texto2 = "123"
let numero2 = Int(texto2)!
print("Convertido para número é \(numero2)")

// 3. Utilizando valor default com ??
let texto3 = "123"
let numero3 = Int(texto3) ?? 0
print("Convertido para número é \(numero3)") // será 0 se inválido