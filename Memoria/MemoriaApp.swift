//
//  MemoriaApp.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 10/02/23.
//

import SwiftUI

@main
struct MemoriaApp: App {
    let game = MemoryViewModel()
    //let model = CalculadoraViewModel()
    var body: some Scene {
        WindowGroup {
            //HelloWorld()
            
            MemoryGameView(viewModel:game)
            
            //CalculadoraView(viewModel:model)
        }
    }
}
