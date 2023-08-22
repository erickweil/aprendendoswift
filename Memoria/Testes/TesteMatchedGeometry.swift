//
//  TesteMatchedGeometry.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 22/08/23.
//

import SwiftUI

struct TesteMatchedGeometry: View {
    @Namespace public var EmojiNS
    
    let emojis = ["🦆","🐶","🦉"]
    @State var emojisOff = 0
    var body: some View {
        ZStack {
            Image(systemName: "triangle.fill")
                .resizable()
                .foregroundColor(.blue)
            
            VStack {
                umEmoji(0)
                Spacer()
                HStack {
                    umEmoji(1)
                    Spacer()
                    umEmoji(2)
                }
            }
            .padding(EdgeInsets(top: 60.0, leading: 50.0, bottom: 28.0, trailing: 50.0))
        }
        .padding()
        .aspectRatio(1.0/1.0, contentMode: .fit)
        .animation(.easeIn(duration: 0.5), value: emojisOff)
        .onTapGesture {
            emojisOff += 1
        }
    }
    
    func umEmoji(_ index: Int) -> some View {
        let qual = (emojisOff + index) % 3
        
        return Text(emojis[qual])
            .padding(10)
            .font(.system(size: 54.0))
            .background {
                Circle()
                    .foregroundColor(.white)
            }
            .foregroundColor(.black)
            .matchedGeometryEffect(id: "\(qual)", in: EmojiNS)
            .id("\(qual)")
            .transition(.asymmetric(insertion: .slide, removal: .identity))
    }
}


struct TesteMatchedGeometry_Previews: PreviewProvider {
    static var previews: some View {
        TesteMatchedGeometry()
    }
}
