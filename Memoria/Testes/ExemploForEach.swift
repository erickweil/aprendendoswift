//
//  ExemploForEach.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 15/08/23.
//

import SwiftUI

struct ExemploForEach: View {
    
    struct Pessoa: Identifiable {
        var id: String { nome }
        
        var nome: String
        var idade: Int
    }
    
    let pessoas = [
        Pessoa(nome: "Maria", idade: 32),
        Pessoa(nome: "Joana", idade: 87),
        Pessoa(nome: "Ítalo", idade: 54),
        Pessoa(nome: "Juracema", idade: 35),
        Pessoa(nome: "Tercio", idade: 67)
    ]

    @State
    var idSelecionado: String = "Maria"
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(pessoas) { pessoa in
                    item(pessoa, pessoa.id == idSelecionado)
                        .onTapGesture {
                            withAnimation {
                                idSelecionado = pessoa.id
                            }
                        }
                }
            }
        }
        
    }
    
    func item(_ pessoa: Pessoa,_ selecionado: Bool)
    -> some View {
        var tam = 200.0
        return
            VStack {
                Text("\(pessoa.nome)")
                    .font(.system(size: 32.0))
                    .foregroundColor(.white)
                Text("\(pessoa.idade)")
                    .font(.system(size: 32.0))
                    .foregroundColor(.white)
            }
            .frame(width: tam,height: tam)
            .background {
                Circle().foregroundColor(selecionado ? .red : .blue)
                    .padding(selecionado ? 0.0 : 20.0)
            }
    }
}

struct ExemploForEach_Previews: PreviewProvider {
    static var previews: some View {
        ExemploForEach()
    }
}
