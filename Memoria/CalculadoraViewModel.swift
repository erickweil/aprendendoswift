//
//  CalculadoraViewModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 02/03/23.
//

import Foundation


class CalculadoraViewModel: ObservableObject {
    
    @Published
    private var model: CalculadoraModel = CalculadoraModel()
    
    var txt: String {
        return "\(model.exprTxt) = \(model.resultado)"
    }
    
    // ---------------------- Intent's ----------------------
    
    func clickButton(_ btnTxt: String) {
        
        if btnTxt == "C" {
            model.eval("")
            return
        }
        
        if btnTxt == "=" {
            model.eval("\(model.resultado)")
            return
        }
        
        let matchNum = "0123456789."
        
        if matchNum.contains(btnTxt) {
            model.eval(model.exprTxt + btnTxt)
        } else {
            model.eval(model.exprTxt + " " + btnTxt)
        }
    }
    
    func eval(_ txtExpr: String) {
        model.eval(txtExpr)
    }
}
