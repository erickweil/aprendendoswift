//
//  ProgressShape.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 09/03/23.
//

import SwiftUI

struct ProgressShape: Shape {
    typealias V2 = UIUtil.PercentPoint
    
    private let pontos = [
        V2(0.0,0.0),
        V2(1.0,0.0),
        
        V2(1.0,1.0),
        V2(0.0,1.0),
        V2(0.0,0.0)
    ]
    
    //var pa = V2(0.0,0.5)
    //var pb = V2(1.0,0.5)
    
    var progress = 0.5
    
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let w = rect.width
        let h = rect.height
        
        let totalDistance:Double = Double(pontos.count)
        let step = 1.0 / totalDistance
        var distance:Double = step
        var lastPoint:CGPoint = CGPoint()
        for ponto in pontos {
            let cgpoint = ponto.cg(w, h)
            
            if p.isEmpty {
                p.move(to: cgpoint)
            } else {
                if distance > progress {
                    let inter = (distance - progress) * Double(pontos.count)
                    p.addLine(to: UIUtil.interpolate(lastPoint, cgpoint, 1.0 - inter))
                } else {
                    p.addLine(to: cgpoint)
                }
            }
            
            
            if distance > progress {
                break
            }
            
            lastPoint = cgpoint
            distance += step
        }
        
        
        
        //let a = pa.cg(w, h)
        //let b = pb.cg(w, h)
        
        //p.move(to: a )
        //p.addLine(to: UIUtil.interpolate(a, b, progress))
        
        return p
    }
    
}
