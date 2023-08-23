//
//  TesteAnimacao.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 22/08/23.
//

import SwiftUI

struct TesteAnimacao: View {

    struct Pais: Identifiable, Hashable {
        var id: String { nome }
        
        var nome: String
        var emoji: String
        var descr: String
    }
    
    let paises = [
        Pais( nome: "Brasil", emoji: "🇧🇷", descr: "Maior país da região, conhecido por sua diversidade cultural, vasta biodiversidade na Floresta Amazônica e paixão pelo futebol." ),
        Pais( nome: "Argentina", emoji: "🇦🇷", descr: "Famosa por sua cultura do tango, carne de qualidade e belezas naturais, como os Andes e as Pampas." ),
        Pais( nome: "Chile", emoji: "🇨🇱", descr: "Estreito e alongado, o Chile se destaca por sua geografia variada, incluindo desertos, lagos e geleiras na Patagônia." ),
        Pais( nome: "Peru", emoji: "🇵🇪", descr: "Reconhecido pelas enigmáticas Linhas de Nazca, a antiga cidade de Machu Picchu e culinária única, como o ceviche." ),
        Pais( nome: "Colômbia", emoji: "🇨🇴", descr: "Diversidade étnica e paisagens que variam de praias caribenhas a florestas tropicais, com uma história rica e cidades vibrantes como Bogotá e Medellín." )
    ];
    
    
    @State private var paisSelecionado: Pais? = nil
    
       var body: some View {
           ZStack {
               // Lista de Países
               VStack {
                   ForEach(paises) { pais in
                       HStack {
                           Image(systemName: "info.circle")
                               .renderingMode(.original)
                               .onTapGesture {
                                   withAnimation {
                                       paisSelecionado = pais
                                   }
                               }
                           
                           Text(pais.nome)
                               .font(.largeTitle)
                           Text(pais.emoji)
                               .font(.largeTitle)
                       }
                   }
                   .frame(maxWidth: .infinity, alignment: .leading)
               }
               .padding()
               
               // Popup
               if let qualPais = paisSelecionado {
                   Color(.black)
                       .opacity(0.4)
                       .ignoresSafeArea(.all)
                       .onTapGesture {
                           withAnimation {
                               paisSelecionado = nil
                           }
                       }
                   
                   VStack {
                       Text("\(qualPais.nome) \(qualPais.emoji)")
                           .font(.largeTitle)
                       
                       Text(qualPais.descr)
                           .font(.body)
                   }
                   .padding()
                   .frame(width: 300,height: 300)
                   .background {
                       let rect = RoundedRectangle(cornerRadius: 20.0)
                       
                       Color(.systemBackground)
                           .clipShape(rect)
                       
                       rect.stroke(lineWidth:4)
                           .foregroundColor(.accentColor)
                   }
                   .transition(.scale)
               }
           }
       }
}

struct TesteAnimacao_Previews: PreviewProvider {
    static var previews: some View {
        TesteAnimacao()
    }
}
