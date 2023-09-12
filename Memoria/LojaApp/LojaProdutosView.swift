//
//  LojaListagemProdutosView.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 12/09/23.
//

import SwiftUI

struct LojaProdutosView: View {
    @ObservedObject var vm: LojaProdutosViewModel
    
    var body: some View {
        List(vm.produtos, id: \.id) { produto in
            NavigationLink {
                LojaDetalhesItemView()
            } label: {
                HStack(alignment: .top) {
                    if let img = produto.images?.first {
                        AsyncImage(url: img) { image in
                            image.resizable()
                                .frame(maxWidth: 80, maxHeight: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .circular))
                        } placeholder: {
                            ZStack {
                                Color.gray
                                ProgressView()
                            }
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .circular))
                        }
                    }
                                        
                    VStack(alignment: .leading) {
                        Text(produto.price, format: .currency(code: Locale.current.currency!.identifier))
                            .font(.headline)
                        
                        Text(produto.title)
                            .font(.subheadline)
                            .bold()
                        
                        Text(produto.description)
                            .font(.subheadline)
                            .lineLimit(3)
                    }
                }
            }
        }.task {
            do {
                try await vm.carregarProdutos()
            } catch {
                print("Erro: \(error.localizedDescription)")
            }
        }.navigationTitle(vm.categoria.name)
    }
}
