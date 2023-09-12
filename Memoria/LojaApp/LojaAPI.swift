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
    
    public static var postProduct: URL {
        URL(string: "/api/v1/products", relativeTo: Self.baseURL)!
    }
    
    public static func load<T: Codable>(_ httpClient: HTTPClient,_ resource: URL,model: T.Type,options: FetchOptions? = nil) async throws -> T {
        let resp = try await httpClient.fetch(resource, options ?? FetchOptions(method: .GET))
        
        guard resp.success else {
            throw NetworkError.errorResponse("Não conseguiu carregar \(resource.absoluteString)")
        }
        
        guard let respModel = try? resp.json(model) else {
            throw NetworkError.errorResponse("Não conseguiu decodificar \(resource.absoluteString)")
        }

        return respModel
    }
}
