//
//  Animacao.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 21/08/23.
//

import SwiftUI

struct Animacao: View {
    @State private var numeroFrutas = 0
    private var frutas = ["Amora","Jabuticaba","Ameixa","Caqui","Caju","Maçã","Jaca","Laranja"]
    var body: some View {
        VStack {
            Text("Frutas:")
            ForEach(frutas[0..<numeroFrutas], id: \.self) { f in
                Text(f)
                    .foregroundColor(.white)
                    .padding(10)
                    .background {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(.blue)
                    }
                    .transition(.slide)
            }
            
            Spacer()
            
            Button("Adicionar Fruta") {
                numeroFrutas = (numeroFrutas + 1) % (frutas.count+1)
            }
            .bold()
            .foregroundColor(.white)
            .padding(20)
            .background {
                RoundedRectangle(cornerRadius: 20.0)
                    .foregroundColor(.accentColor)
            }
        }
        .font(.system(size: 36.0))
        .animation(.default, value: numeroFrutas)
    }
}

struct Animacao_Previews: PreviewProvider {
    static var previews: some View {
        Animacao()
    }
}
