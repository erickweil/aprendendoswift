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
    let httpCLient: HTTPClient
    @State private var pokemons: [Pokemon] = []
    
    private var sortedPokemons: [Pokemon] {
        pokemons.sorted { lhs, rhs in
            guard let lhsId = lhs.id,
                  let rhsId = rhs.id else { return false }
            
            return lhsId > rhsId
        }
    }
    
    private func loadPokemons() async {
        let resource = Resource(url: APIs.pokemon.url, modelType: PokemonResponse.self)
        do {
            let resp = try await httpCLient.load(resource)
            pokemons = resp.results
        } catch {
            pokemons = [ Pokemon(name: error.localizedDescription, url: APIs.pokemon.url)]
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        List(sortedPokemons) { category in
            Text(category.name)
        }.task {
            await loadPokemons()
        }
    }
}

struct PokemonListScreen_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListScreen(httpCLient: HTTPClient())
    }
}
