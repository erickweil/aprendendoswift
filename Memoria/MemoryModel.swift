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
    
    private var faceUpCardID: Int?
    
    mutating func choose(_ card: Card) {
        flip(card)
        print("Virou id:\(card.id) '\(card.content)'")
    }
    
    init(pairs: Int, genCard: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pair in 0..<pairs {
            let content: CardContent = genCard(pair)
            addPair(content,pair)
        }
        
        for elem in 0..<cards.count*10 {
            let rand = Int.random(in: 0..<cards.count-1)
            let i = elem%cards.count
            if rand != i {
                // Trocar o elemento atual pelo "rand"
                swapCards(cards[rand],cards[i])
            }
        }
    }
    
    private mutating func swapCards(_ a: Card,_ b: Card){
        let a_index = findCardIndex(a)
        let b_index = findCardIndex(b)
        
        if a_index == .none || b_index == .none {
            print("Alerta: Não pode fazer swap de cartas porque não encontrou elas")
            return
        }
        
        cards[a_index!] = b
        cards[b_index!] = a
    }
    
    private mutating func addPair(_ content: CardContent,_ pairIndex: Int) {
        let a_id = addCard(content)
        let b_id = addCard(content)
        cards[a_id].pair_id = b_id
        cards[b_id].pair_id = a_id
    }
    
    // mutating porque modifica o array
    private mutating func addCard(_ content:CardContent) -> Int {
        let index = cards.count
        cards.append(Card(id:index,pair_id:-1,content: content))
        return index
    }
    
    func findCardIndex(_ card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return .none
    }
    
    mutating func flip(_ card: Card) {
        let index = findCardIndex(card)
        if index != .none {
            cards[index!].isFaceUp.toggle()
        }
    }

    struct Card : Identifiable{
        var id: Int // ID da carta no array de cartas
        var pair_id: Int // ID da outra carta do par ou -1 se não tem par
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
