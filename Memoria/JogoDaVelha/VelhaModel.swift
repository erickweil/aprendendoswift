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
    
    private var grid: Array<Mark> = [
        .empty,  .empty,  .empty,
        .empty,  .empty,  .empty,
        .empty,  .empty,  .empty
    ]
    
    private static let winningConditions = [
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
    
    private(set) var player = Mark.X
    
    public var whoWon: Mark? {
        for c in VelhaModel.winningConditions {
            if let win = check(grid[c[0]],grid[c[1]],grid[c[2]]) {
                return win
            }
        }
        return nil
    }
    
    private func check(_ a:Mark,_ b:Mark,_ c:Mark) -> Mark? {
        if a == b && a == c && a != .empty {
            return a
        } else {
            return nil
        }
    }
    
    public func at(_ x:Int,_ y:Int) -> Mark {
        return grid[y * 3 + x]
    }
    
    // Clicou em um botão
    public mutating func doMarking(_ x:Int,_ y:Int) {
        if at(x,y) != .empty { return } // Não pode modificar marcações já feitas
        
        grid[y * 3 + x] = player
        
        player = player == .X ? .O : .X
    }
}
