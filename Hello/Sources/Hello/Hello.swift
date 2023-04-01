@main
public struct Hello {
    // https://www.youtube.com/watch?v=n5X_V81OYnQ
    public enum Exemplos {
        case hello, variaveis, arrays, enums, protoc, threads
    }
    public static var qual = Exemplos.threads

    // PONTO DE PARTIDA
    public static func main() {
        print("\n--------------------------")
        print("Teste \(qual)")
        print("--------------------------")
        switch qual {
        case Exemplos.hello:
            print("Hello, World!")
        case .variaveis:
            Variaveis.test()
        case .arrays:
            Arrays.test()
	    case .enums:
	        Enums.test()
        case .protoc:
            Protocols.test()
        case .threads:
            Threads.test()
        }        
    }
}
