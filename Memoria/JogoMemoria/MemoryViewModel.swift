//
//  MemoryViewModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 24/02/23.
//

import Foundation

class MemoryViewModel: ObservableObject {
    typealias Card = MemoryModel<String>.Card
    
    private static let emojis = [
        "🚗","🚕","🚙",
        "🚚","🚛","🚜",
        "🛵","🏍️","🛴",
        "🚲","🛹","🛼",
        "🛺","🚌","🚎",
        "🚋","🚉","🛸",
        "🚀","🛥️","⛵",
        "🛳️","🚤","🚢",
        "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
    ]
    
    private static func createMemoryModel() -> MemoryModel<String> {
        MemoryModel<String>(pairs: 10) {
            pair in
            return emojis[pair]
        }
    }
    
    @Published
    private var model = createMemoryModel()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // ---------------------- Intent's ----------------------
    
    func choose(_ card : Card) {
        model.choose(card)
    }
}
