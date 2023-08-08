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
    
    func reiniciar() {
        self.model = VelhaModel()
    }
    
    func marcacaoParaTexto(_ marcacao: VelhaModel.Marcacao) -> String {
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
    
    func getQuemGanhou() -> String? {
        if let quemGanhou = model.quemGanhou() {
            return marcacaoParaTexto(quemGanhou)
        } else {
            return nil
        }
    }
    
    func getMarcacao(x: Int, y: Int) -> String {
        return marcacaoParaTexto(model.getValor(x,y))
    }
    
    func clicou(x: Int, y: Int) {
        model.clicou(x: x, y: y)
    }
}
