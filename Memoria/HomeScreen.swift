//
//  HomeScreen.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 01/03/23.
//
//

import SwiftUI

// Define o que irá aparecer na Tela
// struct não são classes, não tem herança
// servem para programação funcional
struct HomeScreen: View {
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View /* () */{
        // View que Une várias views uma em cima da outra
        
        let Border = RoundedRectangle(cornerRadius: 25.0)
            .stroke(lineWidth: 6)
            .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
            
        
        VStack {
                Button(action:{},label:{Text("Jogo da Memoria")})
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.blue)
                    .font(.title)
                    .padding()
                    .overlay(
                        Border
                    )
                    .padding()
                                 
                Button(action:{},label:{Text("Calculadora")})
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.blue)
                    .font(.title)
                    .padding()
                    .overlay(
                        Border
                    )
                    .padding()
        
            
            Spacer()
            
        }.padding()
        
    }
}



// Configura o Preview.
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
