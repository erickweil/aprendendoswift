//
//  GridView.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 15/02/23.
//
import SwiftUI

struct GridView: View {
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(.red)
    }
}

struct CardView: View {
    
    // Define um parâmetro
    // Se especificar o valor com {return false} não é possível passar o valor
    // Se especificar o valor com = false será o valor padrão e passar o valor é opcional
    // Se não especificar o valor produz um erro quando não passar
    var isFaceUp: Bool = false
    
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View /* () */{
        // View que Une várias views uma em cima da outra
        ZStack {
            // Define o RoundedRectangle na variável 'shape'
            // Assim não precisa repetir toda vez
            let shape = RoundedRectangle(cornerRadius: 23.0)
            if isFaceUp {
                
                shape.stroke(lineWidth: 3.1415)
                    .foregroundColor(.blue)
                
                shape.fill()
                    .foregroundColor(.white)
                
                // View de Texto
                Text("Hello, worrrld! 🌎")
                    .foregroundColor(.black)
            } else {
                shape.fill()
                    .foregroundColor(.blue)
            }
        }
    }
}

// Configura o Preview.
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .preferredColorScheme(.dark)
        GridView()
            .preferredColorScheme(.light)
    }
}
