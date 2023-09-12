//
//  LojaListagemProdutosViewModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 12/09/23.
//

import Foundation

class LojaProdutosViewModel: ObservableObject {
    @Published var produtos: [LojaModels.Product]
    
    let httpClient: HTTPClient
    let categoria: LojaModels.Category
    
    init(httpClient: HTTPClient, categoria: LojaModels.Category) {
        self.produtos = []
        self.httpClient = httpClient
        self.categoria = categoria
    }
    
    func carregarProdutos() async throws {
        let respModel = try await LojaAPI.load(httpClient, LojaAPI.getProductByCategory(categoria.id), model: [LojaModels.Product].self)

        DispatchQueue.main.async {
            self.produtos = respModel
        }
    }
}
