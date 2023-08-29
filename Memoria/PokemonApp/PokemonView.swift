//
//  PokemonView.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 29/08/23.
//

import SwiftUI

fileprivate let pokemonDefault: PokemonModel = PokemonModel(
    id: -1,
    name: "Nenhum",
    sprites: PokemonModel.Sprites(
        front_default: "Nenhum",
        back_default: "Nenhum"
    )
)


struct PokemonView: View {
    @ObservedObject var viewModel: PokemonViewModel
    
    var body: some View {
        let pokemon = viewModel.pokemon ?? pokemonDefault
        VStack {
            Text(pokemon.name)
                .font(.largeTitle)
                .bold()
            AsyncImage(url: URL(string: pokemon.sprites.front_default)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
            }
        }
        .padding()
        .task {
            do {
                try await viewModel.fetchPokemon()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(viewModel:  PokemonViewModel(id:1, pokemon: nil))
    }
}
