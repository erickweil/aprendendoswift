//
//  VelhaViewModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 08/08/23.
//

import SwiftUI

class VelhaViewModel: ObservableObject {
    @Published
    private var model: VelhaModel
    
    init() {
        self.model = VelhaModel()
    }
    
    func getValor(_ x:Int, _ y: Int) -> String {
        return model.getValor(x, y).rawValue
    }
    
    func jaGanhou() -> Bool {
        return model.checarGanhou() != .vazio
    }
    
    func getQuemGanhou() -> String {
        return model.checarGanhou().rawValue
    }
    
    func clicou(_ x:Int,_ y:Int) {
        print("Clicou em \(x),\(y)")
        model.clicou(x, y)
    }
    
    func reiniciar() {
        self.model = VelhaModel()
    }
}
