// 'Let' quando não podem mudar de valor
let nome: String = "Erick"
let sobrenome = "Weil" // inferência de tipo

// Há várias formas de juntar texto com variáveis
// 1. Juntando texto com +
print("O meu nome completo é \""+nome+" "+sobrenome+"\"")

// 2. Com String interpolator \() 
print("Tamanho do primeiro nome: \(nome.count) letras")

// 3. Ou argumentos no print
print("Começa com A? ", nome.hasPrefix("A"))
print("Termina com k? ", nome.hasSuffix("k"))

// String literal de várias linhas com """
print("""
Vou contar uma história, era meia noite e eu 
estava esperando o ônibus na parada em frente à
minha casa.
""")