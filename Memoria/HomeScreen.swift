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
        NavigationView {
            ScrollView {
                VStack {
                    VStack {
                        Text("Apps Completos:")
                            .font(.title)
                        OptionAppButton(title: "Jogo da Memoria", destination: {
                            MemoryGameView(
                                viewModel:MemoryViewModel(nPares: 10, tema: Tema.temas[0])
                            )
                        })
                        
                        OptionAppButton(title: "Calculadora", destination: {
                            CalculadoraView(
                                viewModel:CalculadoraViewModel()
                            )
                        })
                        
                        //OptionAppButton(title: "Jogo da Velha", destination: //{
                            //VelhaView(viewModel: VelhaViewModel())
                        //})
                        
                    }.padding()
                    
                    VStack {
                        
                        Text("Exemplos de Telas:")
                            .font(.title)
                        OptionAppButton(title: "Clima", destination: { Clima() })
                        OptionAppButton(title: "MacaMordida", destination: { MacaMordida() })
                        OptionAppButton(title: "Perfil", destination: { PerfilUsuario() })
                        
                        Spacer()
                        
                    }.padding()
                }
            }
        }
        
    }
}

struct OptionAppButton<Destination: View>: View {
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    let title: String
    let destination: () -> Destination
    var body: some View {
        NavigationLink(destination:{
            return destination()
        },label:{Text(title)})
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .font(.title)
            .bold()
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                    .fill()
                    .foregroundColor(.accentColor)
                    .shadow(radius: 10, x: 8, y: 8)
            )
            .padding()
    }
}


// Configura o Preview.
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
