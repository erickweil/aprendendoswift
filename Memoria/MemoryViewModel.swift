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

let emojis: Array<String> = [
    "🚗","🚕","🚙",
    "🚚","🚛","🚜",
    "🛵","🏍️","🛴",
    "🚲","🛹","🛼",
    "🛺","🚌","🚎",
    "🚋","🚉","🛸",
    "🚀","🛥️","⛵",
    "🛳️","🚤","🚢"
]

class MemoryViewModel {
    /*private var model: MemoryModel<String> = MemoryModel(pairs: 12, genCard: {
        (pair: Int) -> String in
        return "🚗"
    })*/
    
    private var model: MemoryModel<String> = MemoryModel(pairs: 12) {
        pair in
        return emojis[pair]
    }
    
    var cards: Array<MemoryModel<String>.Card> {
        return model.cards
    }
    
    
}
