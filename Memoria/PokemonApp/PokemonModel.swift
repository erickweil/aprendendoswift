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
    @Published var pokemonTypes: [NameUrlItem] = []
    @Published var typeDetail: PokemonType = PokemonType(id: -1, name: "", pokemon: [])
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func loadPokemonTypes() async throws {
        let resource = Resource(url: APIs.type.url, modelType: RESTResponse<NameUrlItem>.self)
        let resp = try await httpClient.load(resource)
        pokemonTypes = resp.results
    }
    
    func loadTypeDetailURL(url: String) async throws {
        let resource = Resource(url: URL(string:url)!, modelType: PokemonType.self)
        let resp = try await httpClient.load(resource)
        typeDetail = resp
    }
}
