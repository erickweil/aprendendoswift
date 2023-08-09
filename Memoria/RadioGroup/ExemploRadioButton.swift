//
//  ExemploRadioButton.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 08/08/23.
//

import SwiftUI

struct ContentView: View {
    struct Check: Hashable {
        var label: String
        var opcoes: [String]
    }
    
    var checks: [Check] = [
        Check(label: "Gênero", opcoes: ["Masculino", "Feminino"]),
        Check(label: "Lâmpada", opcoes: ["Ligado", "Desligado"]),
        Check(label: "Lâmpada", opcoes: ["Ligado", "Desligado"])
    ]
    var body: some View {
        VStack {
            ForEach(checks, id: \.self) { check in
                VStack {
                    Text(check.label)
                        .font(Font.headline)
                    RadioButtonGroups(opcoes: check.opcoes) { selected in
                        print("Selected Gender is: \(selected)")
                    }
                }.padding(40)
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
