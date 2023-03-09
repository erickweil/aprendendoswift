//
//  UIUtil.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 08/03/23.
//

import SwiftUI

// Utilitários de UI
struct UIUtil {
    
    // Calcula uma fonte para ser múltilo de um tamanho (Geometry Reader)
    public static func font(_ size: CGSize,mult: CGFloat = 1.0) -> Font {
        Font.system(size: min(size.width, size.height) * mult)
    }
    
    // Ponto que é a porcentagem da largura
    struct PercentPoint {
        let x: Double
        let y: Double
        
        init(_ x: Double,_ y: Double) {
            self.x = x
            self.y = y
        }
        
        func add(_ x:Double,_ y:Double) -> PercentPoint {
            return PercentPoint(self.x + x,self.y + y)
        }
        
        func cg(_ w: Double,_ h: Double) -> CGPoint {
            CGPoint(x: self.x * w, y: self.y * h)
        }
    }
}
