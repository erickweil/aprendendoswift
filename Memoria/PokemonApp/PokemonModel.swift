//
//  PokemonModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 25/08/23.
//

import Foundation

@MainActor
class PokemonModel: ObservableObject {
    let httpClient: HTTPClient
    @Published var pokemons: [Pokemon] = []
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadPokemons() async throws {
        let resource = Resource(url: APIs.pokemon.url, modelType: PokemonResponse.self)
        let resp = try await httpClient.load(resource)
        pokemons = resp.results
    }
}
