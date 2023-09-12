//
//  LojaViewModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 12/09/23.
//

import Foundation

class LojaViewModel: ObservableObject {
    @Published var categorias: [LojaModels.Category]
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.categorias = []
        self.httpClient = httpClient
    }
    
    func carregarCategorias() async throws {
        let resp = try await httpClient.fetch(LojaAPI.getCategories)
        
        guard resp.success else {
            throw NetworkError.errorResponse("Não conseguiu listar categorias")
        }
        
        guard let respModel = try? resp.json([LojaModels.Category].self) else {
            throw NetworkError.errorResponse("Não conseguiu decodificar resposta das categorias")
        }

        DispatchQueue.main.async {
            self.categorias = respModel
        }
    }
}
