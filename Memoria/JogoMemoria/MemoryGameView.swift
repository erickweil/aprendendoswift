//
//  MemoryGameView.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 15/02/23.
//
import SwiftUI

struct MemoryGameView: View {

    @ObservedObject
    var viewModel: MemoryViewModel
    
    /* Como o espaço da tela é atribuído Às views?
    1. O container 'oferece' espaço para as views dentro dele
    2. Views escolhem o tamanho que querem ter
    3. Container coloca as views nas posições respectivas
    4. E por último o container redimensiona caso necessário

    HStack e VStack
     Divide o espaço e oferece às views dentro, oferecendo o espaço
     para as view 'inflexíveis' primeiro (Texto, Imagens, ) e views
     'flexíveis' depois (RoundedRectangle)
     
     Uma vez que uma view é oferecida espaço, este tamanho é removido
     do espaço disponível para as próximas
     
     Views 'flexíveis' (que se expandem) irão compartilhar o espaço
     mais ou menos de forma a dividirem por igual
    
     Se QUALQUER view dentro de uma Stack for 'flexível' então a Stack
     também será
     
    Spacer
     View 'muito flexível' para pegar todo o espaço disponível
     
    Divider
     Divide elementos com uma linha
     
    Controlando quão 'flexível' uma view é:
     .layoutPriority(Double)
     
     Tipo que quanto maior a prioridade menos flexível ela é
    */
    
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View {
        VStack {
            ScrollView {
                // Lazy VGrid vai carregar apenas as views que forem necessárias
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 60.0))]) {
                    ForEach(viewModel.cards, content: { card in
                        CardView(card)
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
    private let card: MemoryModel<String>.Card
    
    init(_ card: MemoryModel<String>.Card) {
        self.card = card
    }
    
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View /* () */{
        // View que Une várias views uma em cima da outra
        ZStack {
            // Define o RoundedRectangle na variável 'shape'
            // Assim não precisa repetir toda vez
            let shape = RoundedRectangle(cornerRadius: 23.0)
            
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
    }
}

// Configura o Preview.
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = MemoryViewModel()
        MemoryGameView(viewModel:vm)
            .preferredColorScheme(.light)
    }
}
