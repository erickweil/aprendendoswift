//
//  ContentView.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 10/02/23.
//

import SwiftUI

// Define o que irá aparecer na Tela
// struct não são classes, não tem herança
// servem para programação funcional
struct HelloWorld: View {
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View /* () */{
        // View que Une várias views uma em cima da outra
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
            .stroke(lineWidth: 3.1415)
            .padding()
            .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
            
            // View que Une várias views verticalmente
            VStack {
                // View que exibe Imagem
                Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                // View de Texto
                Text("Hello, worrrld!")
                .foregroundColor(Color.blue)
                 
            }
        }
    }
}



// Configura o Preview.
struct HelloWorld_Previews: PreviewProvider {
    static var previews: some View {
        HelloWorld()
    }
}
