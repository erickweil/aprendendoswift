//
//  FundoCarta.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 06/03/23.
//

import SwiftUI

struct FundoCarta: Shape {
    typealias V2 = UIUtil.PercentPoint
    
    private let pontos = [
        V2(0.0,0.0),
        V2(1.0,0.0),
        
        V2(1.0,1.0),
        V2(0.0,1.0)
    ]
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let w = rect.width
        let h = rect.height
        
        for ponto in pontos {
            let cgpoint = ponto.cg(w, h)
            
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
/*
struct Cardify: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            FundoCarta()
                .stroke(lineWidth: 15.0)
                .foregroundColor(Color.blue)
        }
    }
}*/

struct FundoCarta_Previews: PreviewProvider {
    static var previews: some View {
        
        FundoCarta()
            .stroke(lineWidth: 15.0)
            .foregroundColor(Color.blue)
            .frame(width: 200,height: 200)
    }
}
