// Lendo texto com if let
print("Insira um texto e aperte Enter:")
if let line1 = readLine() {
    print("A linha lida foi:\(line1)")
} else {
    print("Nada foi escrito")
}

// Lendo texto com !
print("Insira um texto e aperte Enter:")
let line2 = readLine()!
print("A linha lida foi:\(line2)")

// Lendo texto com ?? (O valor default é escolhido em caso de nil)
print("Insira um texto e aperte Enter:")
let line3 = readLine() ?? ""
print("A linha lida foi:\(line3)")

// Lendo Números
print("Insira um número para A:")
let A = Int(readLine()!) ?? 0
print("Insira um número para B:")
let B = Int(readLine()!) ?? 0
print("\(A) + \(B) = \(A+B)")