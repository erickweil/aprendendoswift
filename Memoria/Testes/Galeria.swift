//
//  Galeria.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 22/08/23.
//

import SwiftUI

struct Galeria: View {
    @Namespace private var GaleriaNS
    
    struct EmojiInfo: Identifiable, Hashable {
        var id: String { txt }
        
        let txt: String
        let titulo: String
        let info: String
    }
    
    let itemsGaleria: [EmojiInfo] = [
        EmojiInfo(txt: "🦊", titulo: "Raposa", info: "O emoji de Raposa representa alguém sorrateiro, que leva vantagem sempre que possível"),
        EmojiInfo(txt: "🌻", titulo: "Girassol", info: "O emoji de Girassol simboliza felicidade, energia positiva e vitalidade."),
        EmojiInfo(txt: "🐶", titulo: "Cachorro", info: "O emoji de Cachorro representa lealdade, amizade e companheirismo, muitas vezes associado ao melhor amigo do homem."),
        EmojiInfo(txt: "🌍", titulo: "Planeta Terra", info: "O emoji do Planeta Terra simboliza a natureza, o meio ambiente e a importância de cuidar do nosso planeta."),
        EmojiInfo(txt: "📚", titulo: "Livros", info: "O emoji de Livros representa conhecimento, aprendizado e educação, sendo usado para indicar interesse em leitura ou estudos."),
        EmojiInfo(txt: "🍕", titulo: "Pizza", info: "O emoji de Pizza evoca a ideia de comida deliciosa, descontração e momentos de diversão, sendo um símbolo da culinária internacional."),
        EmojiInfo(txt: "🚀", titulo: "Foguete", info: "O emoji de Foguete representa progresso, inovação e a ideia de atingir objetivos de maneira rápida e ambiciosa."),
        EmojiInfo(txt: "💡", titulo: "Lâmpada", info: "O emoji de Lâmpada simboliza ideias, inspiração e criatividade, muitas vezes usado para expressar insights ou sugestões."),
        EmojiInfo(txt: "🏆", titulo: "Troféu", info: "O emoji de Troféu representa conquista, reconhecimento e excelência em um determinado campo ou atividade."),
        EmojiInfo(txt: "🎉", titulo: "Confetes", info: "O emoji de Confetes é usado para comemorar ocasiões especiais e expressar alegria, animação e festividades."),
        EmojiInfo(txt: "⏰", titulo: "Despertador", info: "O emoji de Despertador indica a passagem do tempo, lembretes e a importância de estar pontualmente em algum lugar."),
        EmojiInfo(txt: "🍏", titulo: "Maçã", info: "É só uma maçã")
    ]
    
    @State
    var selecionado: EmojiInfo? = nil
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Text("Escolha um:")
                        .bold()
                        .font(.largeTitle)
                    LazyVGrid(columns: [GridItem(),GridItem(),GridItem()], spacing: 10) {
                        ForEach(itemsGaleria, id: \.self) { item in
                            if selecionado != item {
                                itemGaleria(item)
                                .matchedGeometryEffect(id: item, in: GaleriaNS)
                                .id(item)
                                .transition(.slide)
                                .onTapGesture {
                                    withAnimation {
                                        selecionado = item
                                    }
                                }
                            } else {
                                ZStack {
                                    
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            if let selec = selecionado {
                itemDetalhes(selec)
                .onTapGesture {
                    withAnimation {
                        selecionado = nil
                    }
                }
            }
        }
    }
    
    func itemGaleria(_ item:EmojiInfo) -> some View {
        Text(item.txt)
            .padding()
            .font(.system(size: 72.0))
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.accentColor)
            }
            
    }
    
    func itemDetalhes(_ item:EmojiInfo) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
            .fill()
            .foregroundColor(Color(.systemBackground))
            
            RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 4.0)
            .foregroundColor(.blue)
            VStack {
                Text(item.titulo)
                    .font(.system(size: 36.0))
                
                itemGaleria(item)
                    .matchedGeometryEffect(id: item, in: GaleriaNS)
                    .id(item)
                
                Text(item.info)
                    .font(.system(size: 22.0))
            }
            .padding()
        }
        .padding()
        .aspectRatio(1.0/1.0, contentMode: .fit)
        .frame(maxWidth: .infinity)
        .transition(.asymmetric(insertion: .slide, removal: .scale))
    }
}

struct Galeria_Previews: PreviewProvider {
    static var previews: some View {
        Galeria()
    }
}
