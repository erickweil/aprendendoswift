//
//  VelhaModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 08/08/23.
//

import Foundation

struct VelhaModel {
    enum Marcação: String {
        case vazio = " "
        case bolinha = "O"
        case xis = "X"
    }
    
    var quadro: [Marcação] = [
        .vazio, .vazio, .vazio,
        .vazio, .vazio, .vazio,
        .vazio, .vazio, .vazio
    ]
    
    var jogador: Marcação = .bolinha
    
    func getValor(_ x: Int,_ y: Int) -> Marcação {
        return quadro[y * 3 + x]
    }
    
    mutating func setValor(_ x: Int,_ y: Int,_ marcacao: Marcação) {
        quadro[y * 3 + x] = marcacao
    }
    
    mutating func clicou(_ x: Int, _ y: Int) {
        if getValor(x, y) != .vazio {
            return
        }
        
        if checarGanhou() != .vazio {
            return
        }
        
        setValor(x, y, jogador)
        
        if jogador == .xis {
            jogador = .bolinha
        } else {
            jogador = .xis
        }
    }
    
    // 0 1 2
    // 3 4 5
    // 6 7 8
    
    let condicoesVitoria = [
        // linhas
        [0,1,2],
        [3,4,5],
        [6,7,8],
        
        // colunas
        [0,3,6],
        [1,4,7],
        [2,5,8],
        
        // diagonais
        [0,4,8],
        [2,4,6]
    ]
    
    func checarGanhou() -> Marcação {
        for condicao in condicoesVitoria {
            let a = quadro[condicao[0]]
            let b = quadro[condicao[1]]
            let c = quadro[condicao[2]]
            
            if a == b && a == c {
                if a == .xis {
                    return .xis
                }
                if a == .bolinha {
                    return .bolinha
                }
            }
        }
        return .vazio
    }
}
