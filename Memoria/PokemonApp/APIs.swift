//
//  APIs.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 25/08/23.
//

import Foundation

struct APIs {
    struct EndPoint {
        let url: URL
    }
    
    public static let pokemon = EndPoint(url: URL(string: "https://pokeapi.co/api/v2/pokemon")!)
}
