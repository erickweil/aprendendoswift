//
//  JogoDaVelha.swift
//  Teste
//
//  Created by Erick Leonardo Weil on 25/07/23.
//

import SwiftUI

struct VelhaView: View {
    @ObservedObject
    var viewModel: VelhaViewModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    quad(0,0)
                    quad(0,1)
                    quad(0,2)
                }
                HStack {
                    quad(1,0)
                    quad(1,1)
                    quad(1,2)
                }
                HStack {
                    quad(2,0)
                    quad(2,1)
                    quad(2,2)
                }
            }
            .background(.primary)
            
            if let quemGanhou = viewModel.getQuemGanhou(){
                Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 0.85)
                    .ignoresSafeArea(.all)
                VStack {
                    Spacer()
                    Text("\(quemGanhou) Ganhou!")
                        .font(.system(size: 72.0))
                        .bold()
                        .foregroundColor(.white)
                    
                    Button {
                        viewModel.reiniciar()
                    } label: {
                        Text("Recomeçar")
                            .font(.system(size: 28.0))
                            .foregroundColor(.white)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 10.0)
                            }
                    }
                }
            }
        }
    }
    
    func quad(_ x: Int, _ y: Int) -> some View {
        Quadrado(marcação: viewModel.getMarcacao(x: x, y: y))
            .onTapGesture { viewModel.clicou(x: x, y: y)}
    }
    
    struct Quadrado: View {
        let marcação: String
        var body: some View {
            return Text(marcação)
                .font(.system(size: 72))
                .frame(width: 80,height: 80)
                .background(Color(.systemBackground))
        }
    }
}

struct VelhaView_Previews: PreviewProvider {
    static var previews: some View {
        VelhaView(viewModel: VelhaViewModel())
    }
}
