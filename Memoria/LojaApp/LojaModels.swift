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
    
    struct Product: Codable, Hashable {
        var id: Int? // para poder criar um produto sem ID
        let title: String
        let price: Double
        let description: String
        let images: [URL]?
        let category: Category
    }
}
