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
            addCard(content,pair)
            addCard(content,pair)
        }
    }
    
    // mutating porque modifica o array
    mutating func addCard(_ content:CardContent,_ pair: Int) {
        let index = cards.count
        cards.append(Card(id:index,pair:pair,content: content))
    }
    
    func index(of: Card) -> Int {
        return of.id
    }
    
    mutating func flip(_ card: Card) {
        let id = index(of:card)
        cards[id].isFaceUp.toggle()
    }
    
    mutating func choose(_ card: Card) {
        flip(card)
        print("Virou id:\(card.id) '\(card.content)'")
    }

    struct Card : Identifiable{
        var id: Int
        var pair: Int
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        
        
    }
}
