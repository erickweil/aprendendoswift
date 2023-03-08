//
//  MemoryGame.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 24/02/23.
//

import Foundation

struct MemoryModel<CardContent> {
    
    private(set) var tema: Tema
    // private(set) impede que seja modificado de fora (readonly)
    private(set) var cards: Array<Card>
    
    private(set) var pontos: Int = 0
    // Em vez de setar o valor, detecta de acordo com o que está na lista
    // Esta função retorna o índice se e apenas se houver uma única carta virada para cima
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
    // Ao iniciar o model os pares são adicionados e misturados
    init(pairs: Int, tema: Tema, genCard: (Int) -> CardContent) {
        self.tema = tema
        
        self.cards = []
        
        for pair in 0..<pairs {
            addPair(genCard(pair),pair)
        }
        
        self.cards.shuffle()
    }
    // Função ao clicar em uma carta
    mutating func choose(_ card: Card) {
        print("Virou id:\(card.id) faceup:\(card.isFaceUp) '\(card.content)'") // DEBUG
        
        // Fazer nada se já está para cima
        if card.isFaceUp || card.isMatched { return }
        
        let index = findCardIndex(card) ?? -1
        
        // Fazer nada se o index não foi encontrado
        if index == -1 { return }
        
        if let paraCima = faceUpCardIndex { // Se já tem uma carta para cima
            // Então tem que verificar se elas são um par
            if cards[paraCima].id == cards[index].pair_id {
                cards[paraCima].isMatched = true
                cards[index].isMatched = true
                
                // Cada match dá 2 pontos
                pontos += 2
            } else {
                // Cada mismatch tira 1 ponto por carta já vista antes.
                // Não perde pontos por mismatch de cartas não vistas
                if cards[paraCima].timesSeen > 1 {
                    pontos -= 1
                }
                if cards[index].timesSeen > 1 {
                    pontos -= 1
                }
            }
        } else { // Se não há apenas uma carta para cima (Todas viradas ou mais que uma virada)
            // Então esta será a única para cima agora
            flipAllDown()
        }
        // De qualquer jeito, a carta clicada fica virada para cima agora
        cards[index].flipUp()
    }
    
    private mutating func flipAllDown() {
        for k in 0..<cards.count {
            if !cards[k].isMatched { cards[k].flipDown() }
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

    // Struct definindo uma Carta.
    struct Card : Identifiable{
        let id: Int // ID da carta no array de cartas
        let pair_id: Int // ID da outra carta do par ou -1 se não tem par
        let content: CardContent
        
        private(set) var timesSeen: Int = 0
        private(set) var isFaceUp: Bool = false
        var isMatched: Bool = false
        
        public mutating func flipUp() {
            self.timesSeen += 1
            self.isFaceUp = true
        }
        
        public mutating func flipDown() {
            self.isFaceUp = false
        }
    }
}
