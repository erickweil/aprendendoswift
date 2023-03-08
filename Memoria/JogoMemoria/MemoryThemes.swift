//
//  MemoryThemes.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 07/03/23.
//

import Foundation

// Aqui estão todos os Temas do Jogo da Memória
// A ideia é que um tema pode ser definido em um única linha
public struct Tema {
    private static let MAXIMO_SIMBOLOS = 1000 // Impedir que o genArray trave por escolher intervalos grandes demais
    
    public let descricao: String // Exibido no botão de escolha do tema
    public let cor: Cor // Cor do fundo das cartas
    public let simbolos: Array<String> // Possíveis símbolos que poderão ser utilizados
    public var primeiroSimbolo: String { // Para exibir no botão de escolha do tema
        simbolos.first ?? "?"
    }
    
    // Struct Cor própria para não depender de SwiftUI.Color
    public struct Cor {
        let r: Double
        let g: Double
        let b: Double
        
        public static var red: Cor { Cor(r: 0.8, g: 0.1, b: 0.1)}
        public static var orange: Cor { Cor(r: 0.8, g: 0.75, b: 0)}
        public static var light_gray: Cor { Cor(r: 0.15, g: 0.15, b: 0.15)}
        public static var gray: Cor { Cor(r: 0.5, g: 0.5, b: 0.5)}
        public static var indigo: Cor { Cor(r: 0, g: 0.25, b: 0.74)}
        public static var green: Cor { Cor(r: 0.1, g: 0.8, b: 0.1)}
    }
    
    public static let temas = [
        Tema("Veiculos",Cor.red) { i in stringIter(i,"🚗🚕🚙🚚🚛🚜🛵🏍️🛴🚲🛹🛼🛺🚌🚎🚋🚉🛸🚀🛥️⛵🛳️🚤🚢")},
        Tema("Letras",Cor.light_gray) {i in unicodeIter(i,"A","Z")},
        Tema("Animais",Cor.orange) {i in unicodeIter(i,"🦆","🦔")},
        Tema("Natureza",Cor.green) {i in unicodeIter(i,"🍏","🌮")},
        Tema("Relogios",Cor.gray) {i in unicodeIter(i,"🕐","🕧")},
        Tema("Bandeiras",Cor.indigo) {i in stringIter(i,"🇦🇨🇦🇩🇦🇪🇦🇫🇦🇬🇦🇮🇦🇱🇦🇲🇦🇴🇦🇶🇦🇷🇦🇸🇦🇹🇦🇺🇦🇼🇦🇽🇦🇿🇧🇦🇧🇧🇧🇩🇧🇪🇧🇫🇧🇬🇧🇭🇧🇮🇧🇯🇧🇱🇧🇲🇧🇳🇧🇴🇧🇶🇧🇷🇧🇸🇧🇹🇧🇻🇧🇼🇧🇾🇧🇿🇨🇦🇨🇨🇨🇩🇨🇫🇨🇬🇨🇭🇨🇮🇨🇰🇨🇱🇨🇲🇨🇳🇨🇴🇨🇵🇨🇷🇨🇺🇨🇻🇨🇼🇨🇽🇨🇾🇨🇿🇩🇪🇩🇬🇩🇯🇩🇰🇩🇲🇩🇴🇩🇿🇪🇦🇪🇨🇪🇪🇪🇬🇪🇭🇪🇷🇪🇸🇪🇹🇪🇺🇫🇮🇫🇯🇫🇰🇫🇲🇫🇴🇫🇷🇬🇦🇬🇧🇬🇩🇬🇪🇬🇫🇬🇬🇬🇭🇬🇮🇬🇱🇬🇲🇬🇳🇬🇵🇬🇶🇬🇷🇬🇸🇬🇹🇬🇺🇬🇼🇬🇾🇭🇰🇭🇲🇭🇳🇭🇷🇭🇹🇭🇺🇮🇨🇮🇩🇮🇪🇮🇱🇮🇲🇮🇳🇮🇴🇮🇶🇮🇷🇮🇸🇮🇹🇯🇪🇯🇲🇯🇴🇯🇵🇰🇪🇰🇬🇰🇭🇰🇮🇰🇲🇰🇳🇰🇵🇰🇷🇰🇼🇰🇾🇰🇿🇱🇦🇱🇧🇱🇨🇱🇮🇱🇰🇱🇷🇱🇸🇱🇹🇱🇺🇱🇻🇱🇾🇲🇦🇲🇨🇲🇩🇲🇪🇲🇫🇲🇬🇲🇭🇲🇰🇲🇱🇲🇲🇲🇳🇲🇴🇲🇵🇲🇶🇲🇷🇲🇸🇲🇹🇲🇺🇲🇻🇲🇼🇲🇽🇲🇾🇲🇿🇳🇦🇳🇨🇳🇪🇳🇫🇳🇬🇳🇮🇳🇱🇳🇴🇳🇵🇳🇷🇳🇺🇳🇿🇴🇲🇵🇦🇵🇪🇵🇫🇵🇬🇵🇭🇵🇰🇵🇱🇵🇲🇵🇳🇵🇷🇵🇸🇵🇹🇵🇼🇵🇾🇶🇦🇷🇪🇷🇴🇷🇸🇷🇺🇷🇼🇸🇦🇸🇧🇸🇨🇸🇩🇸🇪🇸🇬🇸🇭🇸🇮🇸🇯🇸🇰🇸🇱🇸🇲🇸🇳🇸🇴🇸🇷🇸🇸🇸🇹🇸🇻🇸🇽🇸🇾🇸🇿🇹🇦🇹🇨🇹🇩🇹🇫🇹🇬🇹🇭🇹🇯🇹🇰🇹🇱🇹🇲🇹🇳🇹🇴🇹🇷🇹🇹🇹🇻🇹🇼🇹🇿🇺🇦🇺🇬🇺🇲🇺🇳🇺🇸🇺🇾🇺🇿🇻🇦🇻🇨🇻🇪🇻🇬🇻🇮🇻🇳🇻🇺🇼🇫🇼🇸🇽🇰🇾🇪🇾🇹🇿🇦🇿🇲🇿🇼🏴󠁧󠁢󠁥󠁮󠁧󠁿🏴󠁧󠁢󠁳󠁣󠁴󠁿🏴󠁧󠁢󠁷󠁬󠁳󠁿")}
    ]
    
    init(_ descricao: String,_ cor: Cor,_ conteudo:@escaping (Int) -> String?) {
        self.descricao = descricao
        self.cor = cor
        self.simbolos = Tema.genArray(conteudo,max: Tema.MAXIMO_SIMBOLOS)
    }
    
    // ---------------------------------------------------------
    //                  Funções para geração de Temas
    // ---------------------------------------------------------
    
    // Retorna uma string para o índice desejado na String ou nil se o índice
    // está fora do intervalo
    private static func stringIter(_ i:Int,_ str: String) -> String? {
        if i < 0 || i >= str.count { return nil }
        
        return String(str[str.index(str.startIndex,offsetBy: i)])
    }

    // Retorna uma letra da codificação Unicode entre charA e charB
    // de acordo com o índice 'i'. ou nil se ocorrer algum problema no processo
    // (se chamar unicodeIter(2,"A","Z") retorna "C" )
    // Obs: Nem todos os emojis funcionam
    private static func unicodeIter(_ i:Int,_ charA: String,_ charB: String) -> String? {
        let uniA = Unicode.Scalar(charA)
        let uniB = Unicode.Scalar(charB)
        
        if uniA == nil || uniB == nil { return nil }
        
        let uniStart = min(uniA!.value,uniB!.value)
        let uniEnd = max(uniA!.value,uniB!.value)
        
        let uniIndex = uniStart + UInt32(i)
        
        if uniIndex > uniEnd { return nil }
        
        let scalar = Unicode.Scalar(uniIndex)
        
        if scalar == nil { return nil }
        
        return String(Character(scalar!))
    }
    
    // A ideia aqui é a partir de uma das duas funções acima, produzir um array de Strings
    // Como elas retornam 'nil' ao fim, esta função irá atravessar as funções geradoras
    // adicionando cada string retornada ao array até chegar no primeiro nil, retornando o array produzido
    private static func genArray(_ generator: (Int) -> String?,max: Int) -> Array<String> {
        var retArr:Array<String> = []
        var i = 0
        while let str = generator(i), i < max {
            retArr.append(str)
            i += 1
        }
        if retArr.isEmpty {
            retArr = ["?"] // nunca deve acontecer.
        }
        return retArr
    }
}
