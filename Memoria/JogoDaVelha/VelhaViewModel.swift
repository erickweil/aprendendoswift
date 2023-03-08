//
//  VelhaViewModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 08/03/23.
//

import Foundation

class VelhaViewModel : ObservableObject {
    
    private static func createVelhaModel() -> VelhaModel {
        return VelhaModel()
    }
    
    @Published
    private var model: VelhaModel
    
    public var whoWon: VelhaModel.Mark? { model.whoWon }
    
    public func at(_ x:Int,_ y:Int) -> VelhaModel.Mark { model.at(x, y) }
    
    public init() {
        self.model = VelhaViewModel.createVelhaModel()
    }
    
    public func doMarking(_ x:Int,_ y:Int) {
        model.doMarking(x, y)
    }
}
