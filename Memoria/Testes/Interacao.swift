//
//  Interacao.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 08/08/23.
//

import SwiftUI

struct Interacao: View {
    var emojis = ["🍏", "🦆", "🐣", "🐶"]
    var body: some View {
        HStack {
            ForEach(emojis, id: \.self, content: { emoji in
                Carta(conteudo: emoji)
                    .foregroundColor(.blue)
                    .frame(width: 70, height: 150)
            })
        }
    }
}

struct Carta: View {
    var conteudo: String
    @State var viradoParaCima: Bool = false
    var body: some View {
        ZStack {
            let borda = RoundedRectangle(cornerRadius: 20)
            if viradoParaCima {
                borda.fill().foregroundColor(.cyan)
                borda.stroke(lineWidth: 3)
                Text(conteudo)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
            } else {
                borda.fill()
            }
        }
        .onTapGesture {
            viradoParaCima = !viradoParaCima
        }
    }
}

struct Interacao_Previews: PreviewProvider {
    static var previews: some View {
        Interacao()
    }
}
