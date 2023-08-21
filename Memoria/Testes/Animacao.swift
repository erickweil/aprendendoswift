//
//  Animacao.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 21/08/23.
//

import SwiftUI

struct Animacao: View {
    
    @Namespace private var animation
    @State private var opçãoEscolhida = 0
    private var opções = ["Página Inicial","Carrinho","Preferências","Sobre"]
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<opções.count, id: \.self) { qual in
                if qual > 0 { Divider() }
                HStack {
                    if qual == opçãoEscolhida {
                        Image(systemName: "triangle.fill")
                            .renderingMode(.template)
                            .rotationEffect(Angle(degrees: 180.0 + 30.0))
                            .foregroundColor(.accentColor)
                            .frame(width: 32.0,height: 32.0)
                            .matchedGeometryEffect(id: "ESCOLHIDO", in: animation)
                    } else {
                        Text("")
                            .frame(width: 32.0,height: 32.0)
                    }
                    
                    Text(opções[qual])
                        .padding()
                        .onTapGesture {
                            opçãoEscolhida = qual
                        }
                }
                .animation(.easeIn(duration: 0.25), value: opçãoEscolhida)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background {
            RoundedRectangle(cornerRadius: 20)
                .stroke()
                .foregroundColor(.blue)
        }
        .padding(40)
    }
}

struct Animacao_Previews: PreviewProvider {
    static var previews: some View {
        Animacao()
    }
}
