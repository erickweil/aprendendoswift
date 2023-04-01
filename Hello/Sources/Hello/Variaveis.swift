public struct Variaveis {
    public static func test() {

        // 'Let' quando não podem mudar de valor
        let nome: String = "Erick"
        let sobrenome = "Weil" // inferência de tipo

        // Juntando texto com +
        print("O meu nome completo é \""+nome+" "+sobrenome+"\"")
        // Com String interpolator \() 
        print("Tamanho do primeiro nome: \(nome.count) letras")
        // Ou argumentos no print
        print("Começa com A? ", nome.hasPrefix("A"))
        print("Termina com k? ", nome.hasSuffix("k"))
        
        // String literal de várias linhas com """
        print("""
        Vou contar uma história, era meia noite e eu 
        estava esperando o ônibus na parada em frente à
        minha casa.
        """)
        // 'var' quando precisa mudar de valor
        var i: Int = 0

        print("----------------------")
        print("Comportamento do i+=1")
        print("Antes: \(i)")
        print("Durante: \(i+=1)") // não tem i++, e i += 1 retorna void
        print("Depois:\(i)")

        // Comportamento dos inteiros

        let nota1 = 59
        let nota2 = 60

        let media = (nota1 + nota2) / 2
        print("Média de \(nota1) e \(nota2) = \(media)")

        let cateto = 3.0
        let cateta = 4.0

        let hipote = (cateto * cateto + cateta * cateta).squareRoot()

        print("Hipotenusa = \(hipote)")
    }
}
