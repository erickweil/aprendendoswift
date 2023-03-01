//
//  MemoryGame.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 24/02/23.
//

import Foundation

struct MemoryModel<CardContent> {
    // private(set) impede que seja modificado de fora (readonly)
    private(set) var cards: Array<Card>
    
    init(pairs: Int, genCard: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pair in 0..<pairs {
            let content: CardContent = genCard(pair)
            addPair(content,pair)
        }
    }
    
    private mutating func addPair(_ content: CardContent,_ pairIndex: Int) {
        let a_id = addCard(content)
        let b_id = addCard(content)
        cards[a_id].pair = b_id
        cards[b_id].pair = a_id
    }
    
    // mutating porque modifica o array
    private mutating func addCard(_ content:CardContent) -> Int {
        let index = cards.count
        cards.append(Card(id:index,pair:-1,content: content))
        return index
    }
    
    func findPair(_ card: Card) -> Card? {
        if card.pair <= -1 || card.pair >= cards.count {
            return .none
        } else {
            return cards[card.pair]
        }
    }
    
    mutating func flip(_ card: Card) {
        cards[card.id].isFaceUp.toggle()
    }
    
    mutating func choose(_ card: Card) {
        flip(card)
        print("Virou id:\(card.id) '\(card.content)'")
    }

    struct Card : Identifiable{
        var id: Int // Índice da cara no array de cartas
        var pair: Int // Índice da outra carta do par ou -1 se não tem par
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        
        
    }
}
