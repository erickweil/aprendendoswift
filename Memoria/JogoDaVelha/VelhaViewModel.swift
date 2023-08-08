//
//  VelhaViewModel.swift
//  Teste
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
    
    func getMarcacao(x: Int, y: Int) -> String {
        let marcacao: VelhaModel.Marcacao = model.quadro[x][y]
        if marcacao == .bolinha {
            return "○"
        }
        else if marcacao == .xis {
            return "𝕏"
        }
        else {
            return " "
        }
    }
    
    func clicou(x: Int, y: Int) {
        model.clicou(x: x, y: y)
    }
}
