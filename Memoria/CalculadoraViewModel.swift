//
//  CalculadoraViewModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 02/03/23.
//

import Foundation


class CalculadoraViewModel: ObservableObject {
    
    public enum Botoes : String {
        case del = "␡"
        case c = "C"
        case par = "()"
        case mod = "﹪"
        case div = "÷"
        case mul = "×"
        case sub = "-"
        case add = "+"
        case eq = "="
        case dot = "."
        case neg = "⁺/₋"
        case n0 = "0"
        case n1 = "1"
        case n2 = "2"
        case n3 = "3"
        case n4 = "4"
        case n5 = "5"
        case n6 = "6"
        case n7 = "7"
        case n8 = "8"
        case n9 = "9"
    }
    
    @Published
    private var model: CalculadoraModel = CalculadoraModel()
    
    var exprTxt: String {
        return "\(model.exprTxt) ="
    }
    var resultado: String {
        if model.resultado.isNaN {
            return " "
        }
        return "\(model.resultado)"
    }
    
    // ---------------------- Intent's ----------------------
    
    func clickButton(_ btn: Botoes) {
        
        if btn == .c {
            model.clear()
            model.eval()
            return
        }
        
        if btn == .eq {
            model.setExprFromTxt("\(model.resultado)")
            model.eval()
            return
        }
        
        //if btn == .del {
        //    model.removeToken()
        //    model.eval()
        //    return
        //}
        
        if btn == .del {
            model.removeTxt()
            model.eval()
            return
        }
        
        var btnTxt: String? = .none
        var btnOp: CalculadoraModel.ElemType? = .none
        switch(btn) {
        case .par: btnOp = .o_par
        case .mod: btnOp = .mod
        case .div: btnOp = .div
        case .mul: btnOp = .mul
        case .sub: btnOp = .sub
        case .add: btnOp = .add
        case .neg: btnOp = .un_sub
        case .dot: btnTxt = "."
        case .n0: btnTxt = "0"
        case .n1: btnTxt = "1"
        case .n2: btnTxt = "2"
        case .n3: btnTxt = "3"
        case .n4: btnTxt = "4"
        case .n5: btnTxt = "5"
        case .n6: btnTxt = "6"
        case .n7: btnTxt = "7"
        case .n8: btnTxt = "8"
        case .n9: btnTxt = "9"
        default:
            btnTxt = .none
            btnOp = .none
        }
        
        if btnTxt != .none {
            model.addTxt(btnTxt!)
        } else if btnOp != .none {
            if btnOp! == .un_sub {
                model.negateIfLastIsValue()
            } else {
                if btnOp! == .o_par && !model.expectingValue {
                    btnOp = .c_par
                }
                
                model.addOp(btnOp!)
            }
        }
        model.eval()
    }
    
    //func eval(_ txtExpr: String) {
    //    model.eval()
    //}
}
