//
//  MemoryViewModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 24/02/23.
//

import Foundation
import SwiftUI
class MemoryViewModel: ObservableObject {
    typealias Card = MemoryModel<String>.Card
    
    
    private static func createMemoryModel(_ estilo: Int) -> MemoryModel<String> {
        var tema = temas[estilo]
        // A função retorna o número de símbolos como primeiro argumento
        var Nsimbolos = tema.simbolos.count
        
        // Não ter mais cartas do que símbolos disponíveis
        let pairs: Int = min(10,Nsimbolos)
        
        let temaShuffled = tema.simbolos.shuffled()
        
        return MemoryModel<String>(pairs: pairs) {
            pair in

            return temaShuffled[pair]
        }
    }
    
    private(set) var estilo = 0
    
    @Published
    private var model = createMemoryModel(0)
    
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var pontos: Int {
        return model.pontos
    }
    
    // ---------------------- Intent's ----------------------
    
    func changeStyle(_ estilo: Int) {
        self.estilo = estilo
        model = MemoryViewModel.createMemoryModel(estilo)
    }
    
    func choose(_ card : Card) {
        model.choose(card)
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
    
    public static let temas = [
        Tema("Veiculos",Color.red) { i in stringIter(i,"🚗🚕🚙🚚🚛🚜🛵🏍️🛴🚲🛹🛼🛺🚌🚎🚋🚉🛸🚀🛥️⛵🛳️🚤🚢")},
        Tema("Letras",Color.init(red: 0.15, green: 0.15, blue: 0.15)) {i in unicodeIter(i,"A","Z")},
        Tema("Animais",Color.orange) {i in unicodeIter(i,"🦆","🦔")},
        Tema("Natureza",Color.green) {i in unicodeIter(i,"🍏","🌮")},
        Tema("Relogios",Color.gray) {i in unicodeIter(i,"🕐","🕧")},
        Tema("Bandeiras",Color.indigo) {i in stringIter(i,"🇦🇨🇦🇩🇦🇪🇦🇫🇦🇬🇦🇮🇦🇱🇦🇲🇦🇴🇦🇶🇦🇷🇦🇸🇦🇹🇦🇺🇦🇼🇦🇽🇦🇿🇧🇦🇧🇧🇧🇩🇧🇪🇧🇫🇧🇬🇧🇭🇧🇮🇧🇯🇧🇱🇧🇲🇧🇳🇧🇴🇧🇶🇧🇷🇧🇸🇧🇹🇧🇻🇧🇼🇧🇾🇧🇿🇨🇦🇨🇨🇨🇩🇨🇫🇨🇬🇨🇭🇨🇮🇨🇰🇨🇱🇨🇲🇨🇳🇨🇴🇨🇵🇨🇷🇨🇺🇨🇻🇨🇼🇨🇽🇨🇾🇨🇿🇩🇪🇩🇬🇩🇯🇩🇰🇩🇲🇩🇴🇩🇿🇪🇦🇪🇨🇪🇪🇪🇬🇪🇭🇪🇷🇪🇸🇪🇹🇪🇺🇫🇮🇫🇯🇫🇰🇫🇲🇫🇴🇫🇷🇬🇦🇬🇧🇬🇩🇬🇪🇬🇫🇬🇬🇬🇭🇬🇮🇬🇱🇬🇲🇬🇳🇬🇵🇬🇶🇬🇷🇬🇸🇬🇹🇬🇺🇬🇼🇬🇾🇭🇰🇭🇲🇭🇳🇭🇷🇭🇹🇭🇺🇮🇨🇮🇩🇮🇪🇮🇱🇮🇲🇮🇳🇮🇴🇮🇶🇮🇷🇮🇸🇮🇹🇯🇪🇯🇲🇯🇴🇯🇵🇰🇪🇰🇬🇰🇭🇰🇮🇰🇲🇰🇳🇰🇵🇰🇷🇰🇼🇰🇾🇰🇿🇱🇦🇱🇧🇱🇨🇱🇮🇱🇰🇱🇷🇱🇸🇱🇹🇱🇺🇱🇻🇱🇾🇲🇦🇲🇨🇲🇩🇲🇪🇲🇫🇲🇬🇲🇭🇲🇰🇲🇱🇲🇲🇲🇳🇲🇴🇲🇵🇲🇶🇲🇷🇲🇸🇲🇹🇲🇺🇲🇻🇲🇼🇲🇽🇲🇾🇲🇿🇳🇦🇳🇨🇳🇪🇳🇫🇳🇬🇳🇮🇳🇱🇳🇴🇳🇵🇳🇷🇳🇺🇳🇿🇴🇲🇵🇦🇵🇪🇵🇫🇵🇬🇵🇭🇵🇰🇵🇱🇵🇲🇵🇳🇵🇷🇵🇸🇵🇹🇵🇼🇵🇾🇶🇦🇷🇪🇷🇴🇷🇸🇷🇺🇷🇼🇸🇦🇸🇧🇸🇨🇸🇩🇸🇪🇸🇬🇸🇭🇸🇮🇸🇯🇸🇰🇸🇱🇸🇲🇸🇳🇸🇴🇸🇷🇸🇸🇸🇹🇸🇻🇸🇽🇸🇾🇸🇿🇹🇦🇹🇨🇹🇩🇹🇫🇹🇬🇹🇭🇹🇯🇹🇰🇹🇱🇹🇲🇹🇳🇹🇴🇹🇷🇹🇹🇹🇻🇹🇼🇹🇿🇺🇦🇺🇬🇺🇲🇺🇳🇺🇸🇺🇾🇺🇿🇻🇦🇻🇨🇻🇪🇻🇬🇻🇮🇻🇳🇻🇺🇼🇫🇼🇸🇽🇰🇾🇪🇾🇹🇿🇦🇿🇲🇿🇼🏴󠁧󠁢󠁥󠁮󠁧󠁿🏴󠁧󠁢󠁳󠁣󠁴󠁿🏴󠁧󠁢󠁷󠁬󠁳󠁿")}
    ]
    
    public struct Tema {
        public let descricao: String
        public let cor: Color
        public var simbolos: Array<String>
        public var primeiroSimbolo: String {
            simbolos.first ?? "?"
        }
        
        init(_ descricao: String,_ cor: Color,_ conteudo:@escaping (Int) -> String?) {
            self.descricao = descricao
            self.cor = cor
            self.simbolos = MemoryViewModel.genArray(conteudo)
        }
    }
}
