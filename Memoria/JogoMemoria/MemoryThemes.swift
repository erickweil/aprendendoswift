//
//  MemoryThemes.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 07/03/23.
//

import Foundation

public struct Tema {
    public let descricao: String
    public let cor: Cor
    public let simbolos: Array<String>
    public var primeiroSimbolo: String {
        simbolos.first ?? "?"
    }
    
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
        self.simbolos = Tema.genArray(conteudo)
    }
    
    private static func genArray(_ generator: (Int) -> String?) -> Array<String> {
        var retArr:Array<String> = []
        var i = 0
        while let str = generator(i) {
            retArr.append(str)
            i += 1
        }
        return retArr
    }

    private static func stringIter(_ i:Int,_ str: String) -> String? {
        if i < 0 || i >= str.count { return nil }
        
        return String(str[str.index(str.startIndex,offsetBy: i)])
    }

    // Retorna uma letra da codificação Unicode entre charA e charB
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
}
