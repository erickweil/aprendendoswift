//
//  CalculadoraModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 02/03/23.
//

import Foundation

struct CalculadoraModel {
    
    private(set) var exprElems: Array<ExprElem> = []
    var exprTxt: String {
        var retTxt = ""
        var lastOp: ElemType? = .none
        var lastElem: ExprElem? = .none
        for elem in exprElems {
            let op = elem.type
            
            if let last = lastElem {
                if last.txt != "("
                && lastOp != .un_add
                && lastOp != .un_sub
                && elem.txt != ")" {
                    // Insere um espaço se tem um elemento antes, (e não coloca espaço nos parênteses)
                    retTxt += " "
                }
            }
            retTxt += elem.txt
            
            lastOp = op
            lastElem = elem
        }
        
        return retTxt
    }
    private(set) var expectingValue: Bool = true
    private(set) var resultado: Double = Double.nan
    
    public static func test() {
        var model = CalculadoraModel()
        model.setExprFromTxt("1 + 2 * 3 / 4")
        model.eval()
        
        print("\(model.exprTxt) = \(model.resultado)")
    }
    
    mutating func clear() {
        exprElems = []
    }
    
    mutating func setExprFromTxt(_ tokenTxt: String) {
        exprElems = ReversePolish.tokenizeExpr(tokenTxt)
    }
    
    mutating func addTxt(_ tokenTxt: String) {
        exprElems = ReversePolish.tokenizeExpr(exprTxt + tokenTxt)
    }
    
    mutating func addOp(_ tokenOp: ElemType) {
        exprElems.append(ExprElem(txt: tokenOp.toTxt(), type: tokenOp))
    }
    
    mutating func removeTxt() {
        if let last = exprElems.last {
            if last.txt.count <= 1 { // pq <= ???
                _ = popToken()
                return
            } else {
                _ = exprElems[exprElems.count-1].txt.removeLast()
            }
        }
    }
    
    mutating func negateIfLastIsValue() {
        if let last = exprElems.last, last.type == .value {
            _ = exprElems.popLast()
            if let lastlast = exprElems.last, lastlast.type == .un_sub {
                _ = exprElems.popLast()
            } else {
                exprElems.append(ExprElem(txt: ElemType.un_sub.toTxt(), type: ElemType.un_sub))
            }
            
            exprElems.append(last)
        } else {
            exprElems.append(ExprElem(txt: ElemType.sub.toTxt(), type: ElemType.sub))
        }
    }
    
    mutating func popToken() -> ExprElem? {
        return exprElems.popLast()
    }

    mutating func eval() {
        // Debug
        ReversePolish.printExpr(exprElems)

        let (rpn_expr,_expectingValue) = ReversePolish.reversePolishExpr(exprElems)

        expectingValue = _expectingValue
        // Debug
        ReversePolish.printExpr(rpn_expr)

        let res = ReversePolish.eval(rpn_expr)
        
        resultado = res ?? Double.nan
        
        // Debug
        print("O resultado é:\(resultado)")
    }
    
    public struct ExprElem {
        var txt: String
        var type: ElemType
        
        func toDouble() -> Double? {
            // https://stackoverflow.com/questions/24031621/swift-how-to-convert-string-to-double
            return Double(txt)
        }
    }

    public enum Associatity {
        case left
        case right
    }

    public enum ElemType {
        case value
        case o_par
        case c_par
        case add
        case sub
        case div
        case mul
        case mod
        case exp
        case un_sub
        case un_add
        
        public func isOp() -> Bool {
            switch(self) {
                case .value: return false
                case .o_par: return false
                case .c_par: return false
                default: return true
            }
        }

        public func getPrecedence() -> Int {
            switch(self) {
                case .o_par: return 20
                case .c_par: return 20
                case .un_sub: return 16
                case .un_add: return 16
                case .exp: return 15
                case .mod: return 14
                case .div: return 14
                case .mul: return 14
                case .add: return 13
                case .sub: return 13
                case .value : return -1
            }
        }

        public func getAssociativity() -> Associatity {
            switch(self) {
                case .exp: return .right
                case .un_add: return .right
                case .un_sub: return .right
                default: return .left
            }
        }
        
        public func getNumberArgs() -> Int {
            switch(self) {
                case .value: return 0
                case .o_par: return 0
                case .c_par: return 0
                case .un_add: return 1
                case .un_sub: return 1
                default: return 2
            }
        }

        public static func fromTxt(_ txt:String) -> ElemType {
            switch(txt) {
                case "(": return .o_par
                case ")": return .c_par
                case "^": return .exp
                case "%": return .mod
                case "/": return .div
                case "*": return .mul
                case "+": return .add
                case "-": return .sub
                default: return .value
            }
        }
        
        public func toTxt() -> String {
            switch(self) {
            case .value: return "v"
            case .o_par: return "("
            case .c_par: return ")"
            case .add: return "+"
            case .sub: return "-"
            case .div: return "/"
            case .mul: return "*"
            case .mod: return "%"
            case .exp: return "^"
            case .un_sub: return "-"
            case .un_add: return "+"
            }
        }

        public static func getAllStr() -> String {
            return "()^%/*+-"
        }
    }

    // https://www.andreinc.net/2010/10/05/converting-infix-to-rpn-shunting-yard-algorithm
    public struct ReversePolish {
        // A ideia é implementar análise de expressões
        // de acordo com a notação Reverse Polish Notation
        // Onde '3 1 2 + *' realiza a conta '3 * (1 + 2)'

        public static func eval(_ expr: Array<ExprElem>) -> Double? {
            var stack: Array<Double> = []
            for elem in expr {
                if elem.type == .value {
                    let doubleval = elem.toDouble()
                    
                    if doubleval == .none {
                        print("Erro, não é um número \(elem.txt)")
                        return .none
                    }
                    
                    stack.append(doubleval!)
                } else if elem.type.isOp() {
                    if elem.type.getNumberArgs() == 2 {
                        let a = stack.popLast()
                        let b = stack.popLast()
                        
                        if a == .none || b == .none {
                            print("Erro, faltou argumentos em \(elem.txt)")
                            return .none
                        }
                        
                        switch(elem.type)
                        {
                        case .add:
                            stack.append(b! + a!)
                        case .sub:
                            stack.append(b! - a!)
                        case .mul:
                            stack.append(b! * a!)
                        case .div:
                            stack.append(b! / a!)
                        case .mod:
                            stack.append(b!.truncatingRemainder(dividingBy: a!))
                        case .exp:
                            stack.append(pow(b!, a!))
                        default:
                            print("Erro, o que é \(elem.txt)?")
                            return .none
                        }
                    } else if elem.type.getNumberArgs() == 1 {
                        let a = stack.popLast()
                        
                        if a == .none {
                            print("Erro, faltou argumentos em \(elem.txt)")
                            return .none
                        }
                        
                        switch(elem.type)
                        {
                        case .un_add:
                            stack.append(a!)
                        case .un_sub:
                            stack.append(-a!)
                        default:
                            print("Erro, o que é \(elem.txt)?")
                            return .none
                        }
                    } else {
                        print("Erro, o que é \(elem.txt)?")
                        return .none
                    }
                }
            }

            return stack.popLast()
        }

        public static func tokenizeExpr(_ str: String) -> Array<ExprElem> {
            let match_ops: String = ElemType.getAllStr()
            let match_space: String = " \t\r\n"
            var expr: Array<ExprElem> = []

            var lastword = ""
            for i in 0..<str.count {
                let letra = str[str.index(str.startIndex,offsetBy: i)]

                var endword = false
                var addops = false
                if match_ops.contains(letra) {
                    endword = true
                    addops = true
                } else if match_space.contains(letra) {
                    endword = true
                }

                if !endword {
                    lastword = lastword + String(letra)
                } else {
                    if lastword != "" {
                        expr.append(ExprElem(txt:lastword,type:.value))
                    }
                    lastword = ""
                }

                if addops {
                    let txt = String(letra)
                    expr.append(ExprElem(txt:txt, type: ElemType.fromTxt(txt)))
                }
            }

            if lastword != "" {
                expr.append(ExprElem(txt:lastword,type:.value))
            }

            return expr
        }

        /*
        Para todos os tokens:
            Leia o próximo token
            Se é operador(x):
                Enquanto tem um operador(y) na stack
                e:
                    x é associativo para esquerda e a precedência menor ou igual a y
                    ou x e associativo para direita e precedência menor que y

                    remove e printa da stack
                por último insere operador y na stack
            Se é abre parênteses:
                insere token na stack
            Se é fecha parênteses:
                remove tudo da stack e printa até chegar no abre parênteses
                por último descarta o abre parênteses
            Senão:
                printa o token
        
        Por último, remove tudo da stack e printa
        */
        public static func reversePolishExpr(_ expr: Array<ExprElem>) -> (expr:Array<ExprElem>,expectingValue:Bool) {
            var output = Array<ExprElem>() // Tudo só que na ordem RPN
            var stack = Array<ExprElem>() // Só entra operadores, ( e ) na stack
            
            // Para identificar operadores unitários
            var expectingValue = true
            for _elem in expr {
                var elem = _elem // não é let mais!
                if elem.type == .o_par {
                    stack.append(elem)
                    expectingValue = true
                } else if elem.type == .c_par {
                    while let stackop = stack.popLast() {
                        if stackop.type == .o_par {
                            break
                        }
                        output.append(stackop)
                    }
                    
                    expectingValue = false
                    // Pop '(' - Precisa mesmo???
                    //_ = stack.popLast()
                } else if elem.type.isOp() {
                    // Se é um - ou + e esperava um valor significa que é um operador unitário
                    if elem.type == .add && expectingValue {
                        elem.type = .un_add
                    }
                    if elem.type == .sub && expectingValue {
                        elem.type = .un_sub
                    }
                    
                    let elemop_pre = elem.type.getPrecedence()
                    while let stackop = stack.last {
                        if stackop.type == .c_par || stackop.type == .o_par {
                            break
                        }
                        let stackop_pre = stackop.type.getPrecedence()

                        if (elem.type.getAssociativity() == .left && elemop_pre <= stackop_pre) ||
                        (elem.type.getAssociativity() == .right && elemop_pre < stackop_pre) {
                            output.append(stack.popLast()!)
                        } else {
                            // Se não pare
                            break
                        }
                    }

                    stack.append(elem)
                    expectingValue = true
                } else if elem.type == .value {
                    output.append(elem)
                    expectingValue = false
                }
            }

            while let stackop = stack.popLast() {
                output.append(stackop)
            }
            
            return (expr:output,expectingValue:expectingValue)
        }

        public static func printExpr(_ expr: Array<ExprElem>) {
           for i in 0..<expr.count {
                print(expr[i].txt,terminator: ", ")
            }
            print()
        }
    }

}
