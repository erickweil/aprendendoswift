//
//  GridView.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 15/02/23.
//
import SwiftUI

struct GridView: View {
    var emojis: Array<String> = [
        "🚗", //carro
        "🚕", //táxi
        "🚙", //jipe
        "🚚", //caminhão
        "🚛", //caminhão pesado
        "🚜", //trator
        "🛵", //motoneta
        "🏍️", //moto
        "🛴", //patinete
        "🚲", //bicicleta
        "🛹", //skate
        "🛼", //patins
        "🛺", //tuk-tuk
        "🚌", //ônibus
        "🚎", //bonde
        "🚋", //trem urbano
        "🚉", //estação de trem
        "🛸", //nave espacial
        "🚀", //foguete
        "🛥️", //iate
        "⛵", //barco a vela
        "🛳️", //navio de cruzeiro
        "🚤", //lancha
        "🚢" //navio de carga
    ]
    @State var emojiCount = 6
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View {
        VStack {
            ScrollView {
                // Lazy VGrid vai carregar apenas as views que forem necessárias
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 75.0))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(txt:emoji)
                    })
                }
                .padding()
                .foregroundColor(.red)
            }
            Spacer()
            
            HStack {
                remove
                // Cria um espaço auto-expansível entre os botões
                Spacer()
                add
            }
        }
        .padding()
    }
    
    // Jeito de separar a lógica de certa parte de uma View sem criar uma view separada
    var add : some View {
        Button(
            action:{
                if emojiCount < emojis.count {
                    emojiCount += 1
                }
            },
            label:{Image(systemName: "plus.circle.fill")}
        )
    }
    
    var remove : some View {
        Button(
            action:{
                if emojiCount > 1 {
                    emojiCount -= 1
                }
            },
            label:{Image(systemName: "minus.circle.fill")}
        )
    }
}

struct CardView: View {
    
    // Define um parâmetro
    // Se especificar o valor com {return false} não é possível passar o valor
    // Se especificar o valor com = false será o valor padrão e passar o valor é opcional
    // Se não especificar o valor produz um erro quando não passar
    var raioRet: Double = 23.0
    
    var txt: String
    
    // Se não especificar o @State, não pode modificar
    // Guarda estados temporários da view (Tipo Estado do React)
    @State var isFaceUp: Bool = false
    
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View /* () */{
        // View que Une várias views uma em cima da outra
        ZStack {
            // Define o RoundedRectangle na variável 'shape'
            // Assim não precisa repetir toda vez
            let shape = RoundedRectangle(cornerRadius: raioRet)
            if isFaceUp {
                
                shape.fill()
                    .foregroundColor(.white)
                
                shape.strokeBorder(lineWidth: 3.1415)
                    .foregroundColor(.blue)
                
                // View de Texto
                Text(txt)
                    .foregroundColor(.black)
            } else {
                shape.fill()
                    .foregroundColor(.blue)
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

// Configura o Preview.
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .preferredColorScheme(.dark)
        GridView()
            .preferredColorScheme(.light)
    }
}
