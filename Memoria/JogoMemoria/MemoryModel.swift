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
    
    // Em vez de setar o valor, detecta de acordo com o que está na lista
    private var faceUpCardIndex: Int? {
        var retIndex: Int? = nil
        var faceUpCount = 0
        for k in 0..<cards.count {
            if !cards[k].isMatched && cards[k].isFaceUp {
                retIndex = k
                faceUpCount += 1
            }
        }
        
        if faceUpCount == 1 {
            return retIndex
        } else {
            return nil
        }
    }
    
    init(pairs: Int, genCard: (Int) -> CardContent) {
        cards = []
        
        for pair in 0..<pairs {
            addPair(genCard(pair),pair)
        }
        
        cards.shuffle()
    }
    
    mutating func choose(_ card: Card) {
        print("Virou id:\(card.id) faceup:\(card.isFaceUp) '\(card.content)'")
        
        // Fazer nada se já está para cima
        if card.isFaceUp || card.isMatched { return }
        
        let index = findCardIndex(card) ?? -1
        
        // Fazer nada se o index não foi encontrado
        if index == -1 { return }
        
        // Se há nenhuma ou mais que uma carta para cima
        if faceUpCardIndex == nil {
            // Então esta será a única para cima agora
            makeTheOnlyUp(index)
        } else {
            // Se tem uma carta para cima
            // Então tem que verificar se elas são um par
            if cards[faceUpCardIndex!].id == cards[index].pair_id {
                cards[faceUpCardIndex!].isMatched = true
                cards[index].isMatched = true
            }
            
            cards[index].isFaceUp = true
        }
    }
    
    private mutating func makeTheOnlyUp(_ index: Int) {
        for k in 0..<cards.count {
            if !cards[k].isMatched {
                cards[k].isFaceUp = (k == index)
            }
        }
    }
    
    private mutating func addPair(_ content: CardContent,_ pairIndex: Int) {
        let a_id = pairIndex * 2 + 0
        let b_id = pairIndex * 2 + 1
        cards.append(Card(id:a_id,pair_id:b_id,content: content))
        cards.append(Card(id:b_id,pair_id:a_id,content: content))
    }
    
    private func findCardIndex(_ card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }

    struct Card : Identifiable{
        let id: Int // ID da carta no array de cartas
        let pair_id: Int // ID da outra carta do par ou -1 se não tem par
        let content: CardContent
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
}
