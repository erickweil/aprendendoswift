//
//  ExemploEfeitos.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 22/08/23.
//
import SwiftUI


struct ExemploEfeitos: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var dataAtual = Date.now
    var calendar = Calendar.current
    var body: some View {
        VStack {
            let hora = calendar.component(.hour, from: dataAtual)
            let minutos = calendar.component(.minute, from: dataAtual)
            let segundos = calendar.component(.second, from: dataAtual)
            
            let efeitoSegundos = Double(segundos) / 60.0
            let efeitoMinutos = Double(minutos) / 60.0 + efeitoSegundos / 60.0
            let efeitoHora = Double(hora % 12) / 12.0 + efeitoMinutos / 12.0
                       
            ZStack {
                Circle()
                    .stroke(lineWidth: 6.0)
                                
                let doispi = Double.pi * 2
                ponteiro(75, 8)
                    .rotationEffect(Angle(degrees: 180 + 360.0 * efeitoHora))
                ponteiro(115, 8)
                    .rotationEffect(Angle(degrees: 180 + 360.0 * efeitoMinutos))
                ponteiro(125, 4)
                    .foregroundColor(.red)
                    .rotationEffect(Angle(degrees: 180 + 360.0 * efeitoSegundos))
                    .animation(.spring(response: 0.2,dampingFraction: 0.15), value: dataAtual)
                
                ForEach(0..<12) { i in
                    Text("-")
                        .font(.largeTitle)
                        .bold()
                        .offset(x: 138)
                        .rotationEffect(Angle(degrees: 360.0/12.0 * CGFloat(i)))
                }
            }
            .padding(50)
            
        }.onReceive(timer) { input in
            dataAtual = input
        }
    }
    
    func ponteiro(_ tamanho: CGFloat, _ largura: CGFloat) -> some View {
        return ZStack {
            Circle()
                .fill()
                .frame(width: 15.0, height: 15.0)
            Rectangle()
                .fill()
                .frame(width: largura,height: tamanho)
                .offset(y: tamanho/2.0)
        }
    }
}

/*
struct ExemploEfeitos: View {
    @State private var rotacionar = false
    
    var body: some View {
        Image(systemName: "cloud.sun.rain")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .rotationEffect(Angle.degrees(rotacionar ? 360 : 0)) // Gira 45 graus se isScaled for verdadeiro
            .onTapGesture {
                if !rotacionar {
                    withAnimation(.linear(duration: 1.0).repeatForever(autoreverses:false)) {
                        rotacionar = true // Faz rotacionar com animação
                    }
                } else {
                    withAnimation(.linear(duration: 0.5)) {
                        rotacionar = false // Faz rotacionar com animação
                    }
                }
            }
            .padding(100)
    }
}*/

struct ExemploEfeitos_Previews: PreviewProvider {
    static var previews: some View {
        ExemploEfeitos()
    }
}
