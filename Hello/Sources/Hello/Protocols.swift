
protocol Printavel {
    func printar() -> String
}

struct Palavra: Printavel {
    var txt: String
    func printar() -> String {
        return txt
    }
}

struct Postagem<Conteudo> where Conteudo: Printavel {
    
}

public struct Protocols {

    // Um Protocol é uma classe sem implementações (Interface?)

    public static func test() {
        
    }
}
