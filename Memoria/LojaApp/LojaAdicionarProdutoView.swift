//
//  LojaAdicionarProdutoView.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 12/09/23.
//

import SwiftUI

struct LojaAdicionarProdutoView: View {
    // Permite chamar para fechar o modal
    @Environment(\.dismiss) private var dismiss
    
    let httpClient: HTTPClient
    var selectedCategory: LojaModels.Category?
    // Um estado para cada Input
    @State private var title: String = ""
    @State private var price: Double?
    @State private var description: String = ""
    //@State private var imageUrl: String = ""
    @State private var errorMessage: String = ""
    
    private func verificarFormulario() -> Bool {
        return !title.isEmpty
        && !(price?.isZero ?? true)
        && !description.isEmpty
        && selectedCategory != nil
        //&& !imageUrl.isEmpty
    }
    
    struct PostProduct: Codable {
        let title: String
        let price: Double
        let description: String
        let categoryId: Int
        let images: [String]
    }
    
    private func salvarProduto() async throws{
        guard let price, let selectedCategory else { return }
        let exemploImgURL =  "https://cdn.ferrari.com/cms/network/media/img/resize/64e3707a15bfaa0011123cd8-ferrari-tailor-made-812-competizione-gtw-2?width=530&height=597"
        
        let result = try await LojaAPI.load(httpClient,LojaAPI.postProduct,
            model: LojaModels.Product.self,
            options: FetchOptions(
                method: .POST,
                body: JSONEncoder().encode(
                    PostProduct(title: title,
                                price: price,
                                description: description,
                                categoryId: selectedCategory.id,
                                images: [exemploImgURL]
                   ))
            )
        )
        
        dismiss()
    }
    
    var body: some View {
        Form {
            TextField("Titulo", text: $title)
            TextField("Preço", value: $price, format: .number)
            TextField("Descrição", text: $description)
            TextField("Categoria", text: .constant(selectedCategory?.name ?? "Sem categoria"))
            
        }
        .navigationTitle("Adicionar Produto")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancelar") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Adicionar") {
                    if verificarFormulario() {
                        Task {
                            do {
                                try await salvarProduto()
                            } catch {
                                print("Erro \(error.localizedDescription)")
                            }
                        }
                    }
                }.disabled(!verificarFormulario())
            }
        }
    }
}

struct LojaAdicionarProdutoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LojaAdicionarProdutoView(httpClient: HTTPClient())
        }
    }
}
