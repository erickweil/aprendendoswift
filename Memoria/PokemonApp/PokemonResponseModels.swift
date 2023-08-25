//
//  Category.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 25/08/23.
//

import Foundation

// Para ficar mais fácil
protocol IssoAiMesmo: Codable, Hashable {
    
}

struct RESTResponse<T: IssoAiMesmo>: IssoAiMesmo, Identifiable {
    let id: Int?
    let count: Int
    let next: String?
    let previous: String?
    let results: [T]
}

// /pokemon
struct NameUrlItem: IssoAiMesmo, Identifiable {
    var id: String? { name }
    let name: String
    let url: String
}

// /type
struct PokemonType: IssoAiMesmo, Identifiable {
    let id: Int
    let name: String
    //let names: [NameItems]
    let pokemon: [PokemonItems]
    
    //struct NameItems: IssoAiMesmo {
    //   let name: String
    //   let language: NameUrlItem
    //}
    
    // /type
    struct PokemonItems: IssoAiMesmo, Identifiable {
        var id: String? { pokemon.name }
        let slot: Int
        let pokemon: NameUrlItem
    }
}


// /pokemon/1
struct Pokemon: IssoAiMesmo, Identifiable {
    let id: Int
    let name: String
    let base_experience: Int
    let height: Int
    let is_default: Bool
    let location_area_encounters: String
    let order: Int
    let weight: Int
    

    let sprites: PokemonSprite
    let types: [TypeItems]
    
    struct PokemonSprite: IssoAiMesmo {
        let front_default: String?
        let front_female: String?
        let front_shiny: String?
        let front_shiny_female: String?
        
        
        let back_default: String?
        let back_shiny: String?
        let back_female: String?
        let back_shiny_female: String?
    }
    
    struct TypeItems: IssoAiMesmo {
        let slot: Int
        let type: NameUrlItem
    }
}
