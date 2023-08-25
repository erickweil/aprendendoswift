//
//  HTTPClient.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 25/08/23.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case serverError(String)
    case decodingError
    case invalidResponse
    case invalidURL
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badRequest:
            return NSLocalizedString("Não foi possível processar a requisição", comment: "badRequestError")
        case .serverError(let errorMessage):
            return NSLocalizedString(errorMessage, comment: "serverError")
        case .decodingError:
            return NSLocalizedString("Não foi capaz de decodificar", comment: "decodingError")
        case .invalidResponse:
            return NSLocalizedString("Resposta Inválida", comment: "invalidResponse")
        case .invalidURL:
            return NSLocalizedString("URL Inválido", comment: "invalidURL")
        }
    }
}

enum HTTPMethod {
    case get([URLQueryItem])
    case post(Data?)
    case delete
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        }
    }
}

struct Resource<T: Codable> {
    let url: URL
    var method: HTTPMethod = .get([])
    var modelType: T.Type
}

// Seria interessante ter um protocol HttpClient e um MockHttpClient para testes...
struct HTTPClient {
    func load<T: Codable>(_ resource: Resource<T>) async throws -> T {
        print(resource.url.absoluteString)
        var request = URLRequest(url: resource.url)
        
        // Constrói a requisição
        switch resource.method {
        case .get(let queryItems):
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            guard let url = components?.url else {
                throw NetworkError.badRequest
            }
            
            request = URLRequest(url: url)
        case .post(let data):
            request.httpMethod = resource.method.name
            request.httpBody = data
            
        case .delete:
            request.httpMethod = resource.method.name
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        let session = URLSession(configuration: configuration)
        
        // faz a chamada da requisição de fato
        let (data, response) = try await session.data(for: request)
        
        guard let _ = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        // guarda a resposta no model passado
        guard let result = try? JSONDecoder().decode(resource.modelType, from: data) else {
            throw NetworkError.decodingError
        }
        
        return result
    }
}
