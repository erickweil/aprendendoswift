//
//  PokemonModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 29/08/23.
//

import Foundation

struct PokemonModel: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let sprites: Sprites
    struct Sprites: Decodable, Hashable {
        let front_default: String
        let back_default: String
    }
}

