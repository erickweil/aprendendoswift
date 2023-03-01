//
//  GridView.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 15/02/23.
//
import SwiftUI

struct GridView: View {

    @ObservedObject
    var viewModel: MemoryViewModel
    
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View {
        VStack {
            ScrollView {
                // Lazy VGrid vai carregar apenas as views que forem necessárias
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 60.0))]) {
                    ForEach(viewModel.cards, content: { card in
                        CardView(card:card)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                    })
                }
                .padding()
                .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct CardView: View {
    
    // Define um parâmetro
    // Se especificar o valor com {return false} não é possível passar o valor
    // Se especificar o valor com = false será o valor padrão e passar o valor é opcional
    // Se não especificar o valor produz um erro quando não passar
    var raioRet: Double = 23.0
    
    var card: MemoryModel<String>.Card
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View /* () */{
        // View que Une várias views uma em cima da outra
        ZStack {
            // Define o RoundedRectangle na variável 'shape'
            // Assim não precisa repetir toda vez
            let shape = RoundedRectangle(cornerRadius: raioRet)
            
            shape.fill()
                .foregroundColor(.white)
            
            if !card.isMatched {
                shape.strokeBorder(lineWidth: 5)
                    .foregroundColor(.blue)
            } else {
                shape.strokeBorder(lineWidth: 5)
                    .foregroundColor(.red)
            }
            
            // View de Texto
            Text(card.content)
                .font(.title)
                .foregroundColor(.black)
            
            if !card.isFaceUp {
                shape.fill()
                    .foregroundColor(.blue)
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
        //.onTapGesture {
            //card.isFaceUp = !card.isFaceUp
        //}
    }
}

// Configura o Preview.
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = MemoryViewModel()
        GridView(viewModel:vm)
            .preferredColorScheme(.light)
    }
}
