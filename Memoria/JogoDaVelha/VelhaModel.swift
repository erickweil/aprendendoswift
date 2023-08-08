//
//  VelhaModel.swift
//  Teste
//
//  Created by Erick Leonardo Weil on 08/08/23.
//

import Foundation

struct VelhaModel {
    enum Marcacao {
        case nada
        case bolinha
        case xis
    }
    
    var quadro: [[Marcacao]] = [
        [.nada,.nada,.nada],
        [.nada,.nada,.nada],
        [.nada,.nada,.nada],
    ]
    
    var jogador: Marcacao = .bolinha
        
    mutating func clicou(x: Int, y: Int) {
        if quadro[x][y] == .nada {
            quadro[x][y] = jogador
            jogador = jogador == .xis ? .bolinha : .xis
        }
    }
}
