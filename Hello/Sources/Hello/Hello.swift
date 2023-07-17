@main
public struct Hello {
    // https://www.youtube.com/watch?v=n5X_V81OYnQ
    public enum Exemplos: String, CaseIterable {
        case hello, arrays, enums, protoc, threads, graphs
    }

    // PONTO DE PARTIDA
    public static func main() {
        print("Escolha um: \(Exemplos.allCases.map { $0.rawValue }) ")
        if let line = readLine() {
            let qual = Exemplos(rawValue: line) ?? .hello
            print("\n--------------------------")
            print("Teste \(qual)")
            print("--------------------------")
            switch qual {
            case Exemplos.hello:
                print("Hello, World!")
            case .arrays:
                Arrays.test()
            case .enums:
                Enums.test()
            case .protoc:
                Protocols.test()
            case .threads:
                Threads.test()
            case .graphs:  
                Graphs.test()
            }
        } else {
            print("Erro ao ler linha")
        }
    }
}
