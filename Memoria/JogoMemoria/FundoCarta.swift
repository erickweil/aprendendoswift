//
//  FundoCarta.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 06/03/23.
//

import SwiftUI

struct FundoCarta: Shape {
    struct V2 {
        let x: Double
        let y: Double
        
        init(_ x: Double, _ y: Double) {
            self.x = x
            self.y = y
        }
    }
    private let pontos_width = 100.0
    private let pontos_height = 100.0
    private let pontos = [
        V2(0,0),
        V2(100,0),
        
        V2(100,100),
        V2(0,100),
        
        
        V2(10,90),
        V2(90,90),
        V2(90,10),
        V2(10,10),
    ]
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        for ponto in pontos {
            let percent_x = ponto.x / pontos_width
            let percent_y = ponto.y / pontos_height
            
            let cgpoint = CGPoint(
                x: rect.width * percent_x,
                y: rect.width * percent_y
            )
            
            if p.isEmpty {
                p.move(to: cgpoint)
            } else {
                p.addLine(to: cgpoint)
            }
        }
        p.closeSubpath()
        
        return p
    }
    
}
struct FundoCarta_Previews: PreviewProvider {
    static var previews: some View {
        
        FundoCarta().fill().foregroundColor(Color.black)
    }
}
