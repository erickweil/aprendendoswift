//
//  ContentView.swift
//  Teste
//
//  Created by Erick Leonardo Weil on 21/07/23.
//

import SwiftUI

struct MacaMordida: View {
    var body: some View {
        VStack {
            ZStack {
                Text("🍎")
                    .font(.system(size: 130.0))
                Text("        ●")
                    .font(.system(size: 70.0))
                    .foregroundColor(.white)
            }
            Text("Programando no Celular da maçã mordida")
                .multilineTextAlignment(.center)
                .font(.system(size: 20.0))
                .frame(width: 240,alignment: .center)
        }
        .padding()
        .background(Color.white)
    }
}

struct MacaMordida_Previews: PreviewProvider {
    static var previews: some View {
        MacaMordida()
    }
}