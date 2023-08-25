//
//  CategoryListScreen.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 25/08/23.
//
// azamsharp "Live Stream - Consuming JSON API in SwiftUI App"
// https://www.youtube.com/watch?v=vF1ayZ1ghrl
import SwiftUI

struct PokemonTypeListScreen: View {
    @EnvironmentObject private var model: PokemonModel
    
    private func loadPokemonTypes() async {
        do {
            try await model.loadPokemonTypes()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        List(model.pokemonTypes) { type in
            NavigationLink(value: type) {
                HStack {
                    image
                    Text(type.name)
                }
            }
        }
        .task {
            await loadPokemonTypes()
        }
        .navigationTitle("Tipos")
        .navigationDestination(for: NameUrlItem.self) { type in
            TypeDetailScreen(type: type)
        }
    }
    
    var image: some View {
        AsyncImage(url: APIs.type.url) { image in
            image
                .resizable()
        } placeholder: {
            Image(systemName: "photo")
                .resizable()
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: 100, height: 100)
        
    }


    struct TypeDetailScreen: View {
        
        let type: NameUrlItem
        
        @EnvironmentObject private var model: PokemonModel
        
        //@State
        //private var pokemons: [PokemonType.PokemonItems] = []
        private func loadTypeDetail() async {
            do {
                try await model.loadTypeDetailURL(url: type.url)
                
                //pokemons = model.typeDetail.pokemons
            } catch {
                print(error.localizedDescription)
            }
        }
        
        var body: some View {
            List {
                ForEach(model.typeDetail.pokemon) { pokemon in
                    NavigationLink(value: pokemon) {
                        HStack {
                            image
                            Text(pokemon.pokemon.name)
                        }
                    }
                }
            }
            Text(model.typeDetail.name)
            .task {
                await loadTypeDetail()
            }
            .navigationTitle("Pokemons")
            .navigationDestination(for: PokemonType.PokemonItems.self) { pokemon in
                Text(pokemon.pokemon.url)
            }
        }
        
        var image: some View {
            AsyncImage(url: APIs.type.url) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            
        }
    }
}

struct PokemonListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PokemonTypeListScreen()
                .environmentObject(PokemonModel(httpClient: HTTPClient()))
        }
    }
}
