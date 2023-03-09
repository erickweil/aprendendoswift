//
//  MemoriaApp.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 10/02/23.
//

import SwiftUI

@main
struct MemoriaApp: App {
    let game = MemoryViewModel(nPares: 10, tema: Tema.temas[0])
    //let model = CalculadoraViewModel()
    var body: some Scene {
        WindowGroup {
            //HelloWorld()
            
            MemoryGameView(viewModel:game)
            
            
            //Cardify_test(Cardify_test.Flipper())
            
            //CalculadoraView(viewModel:model)
        }
    }
}
