//
//  VelhaModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 08/03/23.
//

import Foundation

struct VelhaModel {
    
    public enum Mark {
        case empty
        case X
        case O
    }
    // Na verdade, o primeiro é o X e o segundo é o Y
    // então a grade é um array de colunas
    public var grid: Array<Array<Mark>> = [
        [.empty,  .empty,  .empty],
        [.empty,  .empty,  .empty],
        [.empty,  .empty,  .empty]
    ]
    
    public var player = Mark.X
    
    public func at(_ x:Int,_ y:Int) -> Mark {
        return grid[x][y]
    }
    
    // Clicou em um botão
    public mutating func doMarking(_ x:Int,_ y:Int) {
        if grid[x][y] != .empty { return } // Não pode modificar marcações já feitas
        
        grid[x][y] = player
        
        player = player == .X ? .O : .X
    }
}
