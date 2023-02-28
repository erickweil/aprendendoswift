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

class MemoryViewModel {
    
    
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
    
    private var model: MemoryModel<String> = createMemoryModel()
    
    var cards: Array<MemoryModel<String>.Card> {
        return model.cards
    }
    
    
}
