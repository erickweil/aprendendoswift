//
//  MemoriaApp.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 10/02/23.
//

import SwiftUI

@main
struct MemoriaApp: App {
    //let game = MemoryViewModel(nPares: 10, tema: Tema.temas[0])
    //let model = CalculadoraViewModel()
    //let model = VelhaViewModel()
    let model = EmojiArtViewModel()
    
    var body: some Scene {
        WindowGroup {
            //HelloWorld()
            
            //MemoryGameView(viewModel:game)
            
            //VelhaView(viewModel: model)
            
            //Cardify_test(test:Cardify_test.Flipper())
            
            //CalculadoraView(viewModel:model)
            
            
            EmojiArtView(document: model)
        }
    }
}
