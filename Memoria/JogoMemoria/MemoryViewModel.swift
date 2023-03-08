//
//  MemoryViewModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 24/02/23.
//

import Foundation

class MemoryViewModel: ObservableObject {
    typealias Card = MemoryModel<String>.Card
    
    private static func createMemoryModel(_ quantosPares: Int, tema: Tema) -> MemoryModel<String> {
        // A função retorna o número de símbolos como primeiro argumento
        let Nsimbolos = tema.simbolos.count
        
        // Não ter mais cartas do que símbolos disponíveis
        let pairs: Int = min(quantosPares,Nsimbolos)
        
        // Pega uma cópia misturada dos símbolos
        let temaShuffled = tema.simbolos.shuffled()
        
        return MemoryModel<String>(pairs: pairs,tema:tema) {
            pair in

            return temaShuffled[pair]
        }
    }
    
    
    @Published
    private var model: MemoryModel<String>
    
    private let nParesDefault: Int
    
    public init(nPares: Int,tema: Tema) {
        self.nParesDefault = nPares
        self.model = MemoryViewModel.createMemoryModel(nPares,tema:tema)
    }
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var pontos: Int {
        return model.pontos
    }
    
    var tema: Tema {
        return model.tema
    }
    
    // ---------------------- Intent's ----------------------
    
    func changeTheme(_ tema: Tema) {
        model = MemoryViewModel.createMemoryModel(nParesDefault,tema:tema)
    }
    
    func choose(_ card : Card) {
        model.choose(card)
    }

}
