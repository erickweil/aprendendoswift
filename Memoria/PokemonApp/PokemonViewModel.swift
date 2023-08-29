//
//  PokemonViewModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 29/08/23.
//

import Foundation

class PokemonViewModel: ObservableObject {
    enum PokemonError: Error {
        case urlInvalido
        case respostaInvalida
        case impossivelDecodificar
    }
    
    public var pokemonId: Int
    @Published public var pokemon: PokemonModel? = nil
    
    public init(id: Int,pokemon: PokemonModel?) {
        self.pokemonId = id
        self.pokemon = pokemon
    }
    
    public func fetchPokemon() async throws {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonId)/")
        
        guard let url else {
            throw PokemonError.urlInvalido
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw PokemonError.respostaInvalida
        }
        
        guard let resp = try? JSONDecoder().decode(PokemonModel.self, from: data) else {
            throw PokemonError.impossivelDecodificar
        }
        
        // Aplica a mudança na UI no Main Queue
        DispatchQueue.main.async {
            self.pokemon = resp
        }
    }
}
