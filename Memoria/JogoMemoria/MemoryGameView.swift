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
    
    // Guia sobre melhores práticas em interface da Apple:
    // -----------------------------------------------------------------------------------------
    //                             Apple Human interface guidelines:
    //      https://developer.apple.com/design/human-interface-guidelines/guidelines/overview
    // -----------------------------------------------------------------------------------------
    
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View {

        // Tema contém a cor do fundo das cartas
        let fundoCor = viewModel.tema.cor
        
        // É necessário converter para Color, pois para não depender de SwiftUI é outra struct
        let fundoColor = Color.init(red: fundoCor.r, green: fundoCor.g, blue: fundoCor.b)
        
        VStack {
            ZStack(alignment: Alignment.bottom) {
                AspectVGrid(items: viewModel.cards, aspectRatio: 2.0/2.69, padding: 2.0) { card in
                    CardView(card,fundoColor)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                viewModel.choose(card)
                            }
                        }
                }
                .padding()
                
                PointsIndicator
            }
            ScrollView(.horizontal) {
                HStack {
                    StyleBtn(Tema.temas[0])
                    StyleBtn(Tema.temas[1])
                    StyleBtn(Tema.temas[2])
                    StyleBtn(Tema.temas[3])
                    StyleBtn(Tema.temas[4])
                    StyleBtn(Tema.temas[5])
                }
            }
        }
    }
    
    static let pontosEmoji = [
        "😭","😰","😢","🤧","🥺","😔","😞","☹️","😟",
        "😐",
        "🙂","😊","😃","😁","😆","😂","😍","🤩","😜"
    ]
    
    private var PointsIndicator: some View {
        // A ideia é começar no meio e ir indo para direita ou esquerda conforme
        // ganhar/perder pontos
        let pontos = Double(viewModel.pontos)
        
        // O máximo de pontos é fazer match em todas as cartas, sem errar nenhuma,
        // como ganha 2 pontos por match, o máximo de pontos é a quantidade de cartas
        let maxPontos = Double(viewModel.cards.count)
        
        // Agora a ideia é calcular um valor entre 0 e 1, em vez de -maxpontos a maxpontos
        // onde que 0.5 é 0 pontos.
        let inter = max(0.0,((pontos / maxPontos) + 1.0) / 2.0)
        
        let maxEmoji = Double(MemoryGameView.pontosEmoji.count)
        var emojiPontos = Int(inter * maxEmoji)
        if emojiPontos < 0 { emojiPontos = 0 }
        if emojiPontos >= MemoryGameView.pontosEmoji.count { emojiPontos = MemoryGameView.pontosEmoji.count-1 }
        
        return GeometryReader { geo in
            Text("\(MemoryGameView.pontosEmoji[emojiPontos])")
            .font(.system(size: 40.0))
            .offset(x: (geo.size.width-40.0) * inter)
        }.frame(height: 40.0)
    }
    
    private func StyleBtn(_ tema: Tema) -> some View {
        Button(action:{
            viewModel.changeTheme(tema)
            withAnimation { // Animando a mudança das cartas ao misturar
                viewModel.shuffle()
            }
        },label:{
            VStack {
                //Image(systemName: "paw").resizable().scaledToFit().frame(width: 42.0,height: 42.0)
                Text("\(tema.primeiroSimbolo)")
                    .font(.system(size: 30.0)).frame(width: 30.0,height: 30.0)
                
                Text("\(tema.descricao)")
                    .font(.system(size: 16.0))
            }
            .padding(10)
        })
        .foregroundColor(viewModel.tema.primeiroSimbolo == tema.primeiroSimbolo ? Color.accentColor : Color.secondary)
    }
}

struct CardView: View {
    
    // Define um parâmetro
    // Se especificar o valor com {return false} não é possível passar o valor
    // Se especificar o valor com = false será o valor padrão e passar o valor é opcional
    // Se não especificar o valor produz um erro quando não passar
    private let card: MemoryModel<String>.Card
    
    private let backColor: Color
    
    @State
    var hideVariable = false
    
    @State
    var matchAngle = 0.0
    
    init(_ card: MemoryModel<String>.Card,_ color: Color) {
        self.card = card
        self.backColor = color
    }
    
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View /* () */{
        GeometryReader { geometry in
            Text(card.content)
                .font(UIUtil.font(geometry.size,mult: 0.6))
                .foregroundColor(.black)
                .cardify(isFaceUp: card.isFaceUp, backColor: backColor)
                .scaleEffect(hideVariable ? 0.0 : 1.0)
                .rotationEffect(Angle.degrees(matchAngle))
        }
        .onChange(of: card.isMatched) { newValue in
            // A ideia é animar a carta sumindo 0.5 segundos depois de ter virado
            if newValue ==  true {
                matchAngle = 0.0
                withAnimation(Animation.spring(dampingFraction: 0.22)) {
                    matchAngle = 8.0
                }
                matchAngle = 0.0
                
                withAnimation(Animation.easeInOut(duration: 0.5).delay(0.75)) {
                    hideVariable = true
                }
            } else {
                hideVariable = false
                matchAngle = 0.0
            }
        }
        //.onChange(of: card.timesMismatched) { newValue in
        //}
    }
}

// Configura o Preview.
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = MemoryViewModel(nPares: 10, tema: Tema.temas[0])
        MemoryGameView(viewModel:vm)
            .preferredColorScheme(.light)
    }
}
