//
//  VelhaSimbolos.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 08/03/23.
//

import SwiftUI

struct VelhaSimbolos {
    typealias PercentPoint = UIUtil.PercentPoint
    
    static let symbolScale = 0.88
    static let symbolThick = 0.075
    
    struct Xis: Shape {
        func path(in rect: CGRect) -> Path {
            var p = Path()
            let w = rect.width
            let h = rect.height
            let scale = VelhaSimbolos.symbolScale
            let thick = VelhaSimbolos.symbolThick
            let thick45 = thick / sqrt(2.0)
            
            let center = PercentPoint(0.5, 0.5)
            
            let off = scale - thick45
            let corners = [
                PercentPoint(1.0-off, 1.0-off),
                PercentPoint(off, 1.0-off),
                PercentPoint(off, off),
                PercentPoint(1.0-off, off),
            ]
            
            p.move(to: corners[0].add(-thick45,thick45).cg(w,h))
            p.addLine(to: corners[0].add(thick45,-thick45).cg(w,h))
            p.addLine(to: center.add(0.0,-thick45*2).cg(w,h))
            p.addLine(to: corners[1].add(-thick45,-thick45).cg(w,h))
            p.addLine(to: corners[1].add(thick45,thick45).cg(w,h))
            p.addLine(to: center.add(thick45*2,0).cg(w,h))
            p.addLine(to: corners[2].add(thick45,-thick45).cg(w,h))
            p.addLine(to: corners[2].add(-thick45,thick45).cg(w,h))
            p.addLine(to: center.add(0,thick45*2).cg(w,h))
            p.addLine(to: corners[3].add(thick45,thick45).cg(w,h))
            p.addLine(to: corners[3].add(-thick45,-thick45).cg(w,h))
            p.addLine(to: center.add(-thick45*2,0).cg(w,h))
            p.closeSubpath()
            
            return p
        }
    }
    
    struct Bolinha: Shape {
        func path(in rect: CGRect) -> Path {
            var p = Path()
            let w = rect.width
            let h = rect.height
            let scale = VelhaSimbolos.symbolScale
            let thick = VelhaSimbolos.symbolThick
            //let thick45 = thick / sqrt(2.0)
            
            let center = PercentPoint(0.5, 0.5)
            
            p.addArc(
                center: center.cg(w,h),
                radius: (scale * w)/2.0,
                startAngle: Angle(radians: 0.0),
                endAngle: Angle(radians: Double.pi*2),
                clockwise: false)
            
            p.addArc(
                center: center.cg(w,h),
                radius: (scale * w)/2.0 - thick*2 * w,
                startAngle: Angle(radians: 0.0),
                endAngle: Angle(radians: Double.pi*2),
                clockwise: true)
            
            p.closeSubpath()
            
            return p
        }
    }
}


struct VelhaSimbolos_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0.0) {
            VelhaSimbolos.Xis().fill().foregroundColor(Color.black).overlay {
                Rectangle().strokeBorder()
            }
            VelhaSimbolos.Bolinha().fill().foregroundColor(Color.black).overlay {
                Rectangle().strokeBorder()
            }
        }
        .aspectRatio(1.0/2.0, contentMode: .fit)
        .padding(40.0)
    }
}

