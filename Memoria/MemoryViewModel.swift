//
//  MemoryViewModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 24/02/23.
//

import Foundation

/*func genCard(pair: Int) -> String {
    return "🚗"
}*/

class MemoryViewModel: ObservableObject {
    static let emojis: Array<String> = [
        "🚗","🚕","🚙",
        "🚚","🚛","🚜",
        "🛵","🏍️","🛴",
        "🚲","🛹","🛼",
        "🛺","🚌","🚎",
        "🚋","🚉","🛸",
        "🚀","🛥️","⛵",
        "🛳️","🚤","🚢"
    ]
    
    static func createMemoryModel() -> MemoryModel<String> {
        MemoryModel<String>(pairs: 8) {
            pair in
            return emojis[pair]
        }
    }
    
    /*private var model: MemoryModel<String> = MemoryModel(pairs: 12, genCard: {
        (pair: Int) -> String in
        return "🚗"
    })*/
    
    @Published
    private var model: MemoryModel<String> = createMemoryModel()
    
    var cards: Array<MemoryModel<String>.Card> {
        return model.cards
    }
    
    // ---------------------- Intent's ----------------------
    
    func choose(_ card : MemoryModel<String>.Card) {
        model.choose(card)
    }
}
