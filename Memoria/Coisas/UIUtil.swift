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
}
