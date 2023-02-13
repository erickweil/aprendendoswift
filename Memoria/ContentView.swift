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
struct ContentView: View {
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View /* () */{
        // View que Une várias views verticalmente
        /* return */ VStack {
            // View que exibe Imagem
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            // View de Texto
            Text("Hello, worrrld!")
                .foregroundColor(Color.blue)
                
        }
        .padding()
    }
}



// Configura o Preview.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
