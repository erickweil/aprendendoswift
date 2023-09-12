//
//  APIs.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 25/08/23.
//

import Foundation

class LojaAPI {
    
    public static var baseURL: URL {
        URL(string: "https://api.escuelajs.co")!
    }
    
    public static var getCategories: URL {
        URL(string: "/api/v1/categories", relativeTo: Self.baseURL)!
    }
    
    public static func getProductByCategory(_ categoryId: Int) -> URL {
        URL(string: "/api/v1/categories/\(categoryId)/products", relativeTo: Self.baseURL)!
    }
}
