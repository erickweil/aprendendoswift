//
//  APIs.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 25/08/23.
//

import Foundation

enum APIs {
    case pokemon
    case type
    
    private var baseURL: URL {
        URL(string: "https://pokeapi.co")!
    }
    
    
    var url: URL {
        switch self {
        case .pokemon:
            return baseURL.appendingPathComponent("/api/v2/pokemon")
        case .type:
            return baseURL.appendingPathComponent("/api/v2/type")
        }
    }
}
