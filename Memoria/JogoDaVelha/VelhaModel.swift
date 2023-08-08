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
    
    var quadro: [Marcacao] = [
        .nada,.nada,.nada,
        .nada,.nada,.nada,
        .nada,.nada,.nada,
    ]
    
    var jogador: Marcacao = .bolinha
    
    public func getValor(_ x:Int,_ y:Int) -> Marcacao {
        return quadro[y * 3 + x]
    }
    
    public mutating func setValor(_ x:Int,_ y:Int,_ marcacao: Marcacao) {
        quadro[y * 3 + x] = marcacao
    }
    
    public mutating func clicou(x: Int, y: Int) {
        if getValor(x,y) == .nada {
            setValor(x,y,jogador)
            jogador = jogador == .xis ? .bolinha : .xis
        }
    }
    
    
    private static let condicoesGanhou = [
        // Horizontal
        [0,1,2],
        [3,4,5],
        [6,7,8],
        
        // Vertical
        [0,3,6],
        [1,4,7],
        [2,5,8],
        
        // Diagonais
        [0,4,8],
        [2,4,6]
    ]
    
    public func quemGanhou() -> Marcacao? {
        for c in VelhaModel.condicoesGanhou {
            if let ganhou = verificar(quadro[c[0]],quadro[c[1]],quadro[c[2]]) {
                return ganhou
            }
        }
        return nil
    }
    
    private func verificar(_ a:Marcacao,_ b:Marcacao,_ c:Marcacao) -> Marcacao? {
        if a == b && a == c && a != .nada {
            return a
        } else {
            return nil
        }
    }
}
