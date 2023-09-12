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
        let resp = try await httpClient.fetch(LojaAPI.getProductByCategory(categoria.id))
        
        guard resp.success else {
            throw NetworkError.errorResponse("Não conseguiu listar produtos")
        }
        
        guard let respModel = try? resp.json([LojaModels.Product].self) else {
            throw NetworkError.errorResponse("Não conseguiu decodificar resposta dos produtos")
        }

        DispatchQueue.main.async {
            self.produtos = respModel
        }
    }
}
