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
    
    var exprTxt: String {
        return "\(model.exprTxt) ="
    }
    var resultado: String {
        return "\(model.resultado)"
    }
    
    // ---------------------- Intent's ----------------------
    
    func clickButton(_ btnTxt: String) {
        
        if btnTxt == "C" {
            model.clear()
            model.eval()
            return
        }
        
        if btnTxt == "=" {
            model.setExprFromTxt("\(model.resultado)")
            model.eval()
            return
        }
        
        if btnTxt == "CE" {
            model.removeToken()
            model.eval()
            return
        }
        
        if btnTxt == "<-" {
            model.removeTxt()
            model.eval()
            return
        }
                
        model.addTxt(btnTxt)
        model.eval()
    }
    
    //func eval(_ txtExpr: String) {
    //    model.eval()
    //}
}
