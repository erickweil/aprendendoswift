@main
public struct Hello {
    // https://www.youtube.com/watch?v=n5X_V81OYnQ
    public enum Exemplos {
        case hello, variaveis, arrays, enums, rpn
    }
    public static var qual = Exemplos.rpn

    // PONTO DE PARTIDA
    public static func main() {
        switch qual {
        case Exemplos.hello:
            print("Hello, World!")
        case .variaveis:
            Variaveis.test()
        case .arrays:
            Arrays.test()
	case .enums:
	    Enums.test()
        case .rpn:
        ReversePolish.test()
        }        
    }
}
