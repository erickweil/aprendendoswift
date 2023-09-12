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
        let respModel = try await LojaAPI.load(httpClient, LojaAPI.getCategories, model: [LojaModels.Category].self)

        DispatchQueue.main.async {
            self.categorias = respModel
        }
    }
}
