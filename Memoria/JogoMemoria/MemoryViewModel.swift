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
        var alreadyChoosen = ""
        // A função retorna o número de símbolos como primeiro argumento
        var Nsimbolos:Int
        (Nsimbolos, _) = temas[estilo].proximoSimbolo()
        
        // Não ter mais cartas do que símbolos disponíveis
        let pairs: Int = min(15,Nsimbolos)
        
        return MemoryModel<String>(pairs: pairs) {
            pair in
            
            // Encontra um símbolo que não tenha sido escolhido já
            var str: Character = "€"
            var count: Int = 0
            repeat {
                (_, str) = temas[estilo].proximoSimbolo()
                count += 1
            } while alreadyChoosen.contains(str) && count < 1000
            
            alreadyChoosen += String(str)
            return String(str)
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
    
    private static func randomString(_ str: String) -> (Int,Character) {
        let randomInt = Int.random(in: 0..<str.count)
        return (str.count,str[str.index(str.startIndex,offsetBy: randomInt)])
    }
    
    
    private static func randomBetween(_ charA: String,_ charB: String) -> (Int,Character) {
        
        repeat {
            let uniA = Unicode.Scalar(charA)
            let uniB = Unicode.Scalar(charB)
            
            if uniA == nil || uniB == nil { break }
            
            let uniStart = min(uniA!.value,uniB!.value)
            let uniEnd = max(uniA!.value,uniB!.value)
            
            let randomInt: UInt32 = UInt32(Int64.random(in: Int64(uniStart)..<Int64(uniEnd+1)))
            
            let scalar = Unicode.Scalar(randomInt)
            
            if scalar == nil { break }
            
            return (Int(uniEnd - uniStart),Character(scalar!))
        } while false
        
        return (1,"⍰")
    }
    
    public static let temas = [
        Tema("Veiculos",Color.red,"🚗") {randomString("🚗🚕🚙🚚🚛🚜🛵🏍️🛴🚲🛹🛼🛺🚌🚎🚋🚉🛸🚀🛥️⛵🛳️🚤🚢")},
        Tema("Letras",Color.init(red: 0.15, green: 0.15, blue: 0.15),"A") {randomBetween("A","Z")},
        Tema("Animais",Color.orange,"🦆") {randomBetween("🦆","🦔")},
        Tema("Natureza",Color.green,"🍏") {randomBetween("🍏","🌮")},
        Tema("Relogios",Color.gray,"🕐") {randomBetween("🕐","🕧")},
        Tema("Bandeiras",Color.indigo,"🇧🇷") {randomString("🇦🇨🇦🇩🇦🇪🇦🇫🇦🇬🇦🇮🇦🇱🇦🇲🇦🇴🇦🇶🇦🇷🇦🇸🇦🇹🇦🇺🇦🇼🇦🇽🇦🇿🇧🇦🇧🇧🇧🇩🇧🇪🇧🇫🇧🇬🇧🇭🇧🇮🇧🇯🇧🇱🇧🇲🇧🇳🇧🇴🇧🇶🇧🇷🇧🇸🇧🇹🇧🇻🇧🇼🇧🇾🇧🇿🇨🇦🇨🇨🇨🇩🇨🇫🇨🇬🇨🇭🇨🇮🇨🇰🇨🇱🇨🇲🇨🇳🇨🇴🇨🇵🇨🇷🇨🇺🇨🇻🇨🇼🇨🇽🇨🇾🇨🇿🇩🇪🇩🇬🇩🇯🇩🇰🇩🇲🇩🇴🇩🇿🇪🇦🇪🇨🇪🇪🇪🇬🇪🇭🇪🇷🇪🇸🇪🇹🇪🇺🇫🇮🇫🇯🇫🇰🇫🇲🇫🇴🇫🇷🇬🇦🇬🇧🇬🇩🇬🇪🇬🇫🇬🇬🇬🇭🇬🇮🇬🇱🇬🇲🇬🇳🇬🇵🇬🇶🇬🇷🇬🇸🇬🇹🇬🇺🇬🇼🇬🇾🇭🇰🇭🇲🇭🇳🇭🇷🇭🇹🇭🇺🇮🇨🇮🇩🇮🇪🇮🇱🇮🇲🇮🇳🇮🇴🇮🇶🇮🇷🇮🇸🇮🇹🇯🇪🇯🇲🇯🇴🇯🇵🇰🇪🇰🇬🇰🇭🇰🇮🇰🇲🇰🇳🇰🇵🇰🇷🇰🇼🇰🇾🇰🇿🇱🇦🇱🇧🇱🇨🇱🇮🇱🇰🇱🇷🇱🇸🇱🇹🇱🇺🇱🇻🇱🇾🇲🇦🇲🇨🇲🇩🇲🇪🇲🇫🇲🇬🇲🇭🇲🇰🇲🇱🇲🇲🇲🇳🇲🇴🇲🇵🇲🇶🇲🇷🇲🇸🇲🇹🇲🇺🇲🇻🇲🇼🇲🇽🇲🇾🇲🇿🇳🇦🇳🇨🇳🇪🇳🇫🇳🇬🇳🇮🇳🇱🇳🇴🇳🇵🇳🇷🇳🇺🇳🇿🇴🇲🇵🇦🇵🇪🇵🇫🇵🇬🇵🇭🇵🇰🇵🇱🇵🇲🇵🇳🇵🇷🇵🇸🇵🇹🇵🇼🇵🇾🇶🇦🇷🇪🇷🇴🇷🇸🇷🇺🇷🇼🇸🇦🇸🇧🇸🇨🇸🇩🇸🇪🇸🇬🇸🇭🇸🇮🇸🇯🇸🇰🇸🇱🇸🇲🇸🇳🇸🇴🇸🇷🇸🇸🇸🇹🇸🇻🇸🇽🇸🇾🇸🇿🇹🇦🇹🇨🇹🇩🇹🇫🇹🇬🇹🇭🇹🇯🇹🇰🇹🇱🇹🇲🇹🇳🇹🇴🇹🇷🇹🇹🇹🇻🇹🇼🇹🇿🇺🇦🇺🇬🇺🇲🇺🇳🇺🇸🇺🇾🇺🇿🇻🇦🇻🇨🇻🇪🇻🇬🇻🇮🇻🇳🇻🇺🇼🇫🇼🇸🇽🇰🇾🇪🇾🇹🇿🇦🇿🇲🇿🇼🏴󠁧󠁢󠁥󠁮󠁧󠁿🏴󠁧󠁢󠁳󠁣󠁴󠁿🏴󠁧󠁢󠁷󠁬󠁳󠁿")}
    ]
    
    public struct Tema {
        public let descricao: String
        public let cor: Color
        public let primeiroSimbolo: String
        public let proximoSimbolo: () -> (Int,Character)
        
        init(_ descricao: String,_ cor: Color,_ primeiroSimbolo: String,_ conteudo:@escaping () -> (Int,Character)) {
            self.descricao = descricao
            self.cor = cor
            self.primeiroSimbolo = primeiroSimbolo
            self.proximoSimbolo = conteudo
        }
    }
}
