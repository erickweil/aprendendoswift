//
//  LojaModels.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 12/09/23.
//

import Foundation

struct LojaModels {
    
    struct Category: Codable, Hashable {
        let id: Int
        let name: String
        let image: URL
    }
}
