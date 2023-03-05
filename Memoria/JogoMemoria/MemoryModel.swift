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
    
    private var faceUpCardIndex: Int?
    
    mutating func choose(_ card: Card) {
        print("Virou id:\(card.id) faceup:\(card.isFaceUp) '\(card.content)'")
        
        // Fazer nada se já está para cima
        if card.isFaceUp || card.isMatched {
            print("\t Fazer nada porque carta está para cima")
            return
        }
        
        let index = findCardIndex(card) ?? -1
        // Fazer nada se o index não foi encontrado
        if index == -1 {
            print("\t Fazer nada porque carta não foi encontrada")
            return
        }
        
        if faceUpCardIndex == nil {
            // Se não tem nenhuma carta para cima
            // Então esta será a única para cima agora
            for k in 0..<cards.count {
                if !cards[k].isMatched {
                    cards[k].isFaceUp = false
                }
            }
            flip(index)
            faceUpCardIndex = index
            
            print("\t Executou flip na carta, agora essa é a carta virada")
        } else {
            // Se tem uma carta para cima
            // Então tem que verificar se elas tem o mesmo conteudo
            if cards[faceUpCardIndex!].id == cards[index].pair_id {
                // Se tem o mesmo conteúdo então eles estão OK!
                cards[faceUpCardIndex!].isMatched = true
                cards[index].isMatched = true
                print("\t Executou match!")
            } else {
                print("\t Não deu match...")
            }
            
            flip(index)
            
            // Independente, vai agora desmarcar a carta faceup
            faceUpCardIndex = nil
        }
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
                let temp = cards[i]
                cards[i] = cards[rand]
                cards[rand] = temp
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
    
    private mutating func flip(_ card_index: Int) {
        cards[card_index].isFaceUp.toggle()
    }

    struct Card : Identifiable{
        let id: Int // ID da carta no array de cartas
        let pair_id: Int // ID da outra carta do par ou -1 se não tem par
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
    }
}
