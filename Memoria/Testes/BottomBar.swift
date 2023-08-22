//
//  BottomBar.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 15/08/23.
//

import SwiftUI

struct BottomBar: View {
    var body: some View {
        ZStack {
                       
            VStack {
                HStack {
                    Icone(img: "house")
                    Spacer()
                    Icone(img: "checklist", selecionado: true)
                    Spacer()
                    Icone(img: "hammer")
                    Spacer()
                    Icone(img: "fuelpump")
                }
                .padding(40.0)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 66.0)
                .background {
                    RoundedRectangle(cornerRadius: 30.0)
                        .foregroundColor(Color("Roxo"))
                }
            }
            .padding()
        }
    }
}


struct Icone: View {
    var img: String
    var selecionado: Bool = false
    var body: some View {
        Image(systemName: img)
        .background {
            if selecionado {
                Image("IconeTriangulo")
                    .resizable()
                    .tint(.white)
                    .frame(width: 72.0,height: 72.0)
                    .offset(CGSize(width: 0, height: -45.0))
            }
        }
        .padding(24.0)
        .clipShape(Rectangle())
        
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
