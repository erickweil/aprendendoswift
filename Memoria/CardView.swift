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
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(.red)
    }
}

struct CardView: View {
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View /* () */{
        // View que Une várias views uma em cima da outra
        ZStack {
            RoundedRectangle(cornerRadius: 23.0)
            .stroke(lineWidth: 3.1415)
            .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
            
            // View de Texto
            Text("Hello, worrrld!")
            .foregroundColor(Color.blue)
        }
    }
}

// Configura o Preview.
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
