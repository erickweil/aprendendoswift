//
//  CategoryListScreen.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 25/08/23.
//
// azamsharp "Live Stream - Consuming JSON API in SwiftUI App"
// https://www.youtube.com/watch?v=vF1ayZ1ghrl
import SwiftUI

struct PokemonListScreen: View {
    @EnvironmentObject private var model: PokemonModel
    
    private func loadPokemons() async {
        do {
            try await model.loadPokemons()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        List(model.pokemons) { pokemon in
            Text(pokemon.name)
        }.task {
            await loadPokemons()
        }
    }
}

struct PokemonListScreen_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListScreen()
            .environmentObject(PokemonModel(httpClient: HTTPClient()))
    }
}
