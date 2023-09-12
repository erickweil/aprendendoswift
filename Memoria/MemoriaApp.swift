//
//  MemoriaApp.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 10/02/23.
//

import SwiftUI

@main
struct MemoriaApp: App {    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LojaView(vm: LojaViewModel(httpClient: HTTPClient()))
            }
            
            //ExemploMenu()
            //TesteMatchedGeometry()
            //Galeria()
            //ExemploEfeitos()
            //TesteAnimacao()
            //HomeScreen()
            //VelhaView(viewModel: VelhaViewModel())
            //NavigationStack {
             //   PokemonTypeListScreen()
            //}.environmentObject(PokemonModel(httpClient: HTTPClient()))
        }
    }
}
