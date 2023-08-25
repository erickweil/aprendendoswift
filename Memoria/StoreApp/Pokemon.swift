//
//  Category.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 25/08/23.
//

import Foundation


struct Pokemon: Codable, Identifiable, Hashable {
    var id: String? { name }
    let name: String
    let url: URL
}

struct PokemonResponse: Codable, Identifiable, Hashable {
    let id: Int?
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}
