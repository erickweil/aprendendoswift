//
//  VelhaView.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 08/08/23.
//

import SwiftUI

struct VelhaView: View {
    @ObservedObject
    var viewModel: VelhaViewModel
    
    var body: some View {
        ZStack {
            if viewModel.jaGanhou() {
                VStack {
                    Spacer()
                    Text("\(viewModel.getQuemGanhou()) Ganhou!")
                        .font(.largeTitle)
                    
                    Button(action: {
                        viewModel.reiniciar()
                    }, label: {
                        Text("Reiniciar Jogo")
                            .font(.largeTitle)
                    })
                }
            }
            
            VStack {
                HStack {
                    quad(0,0)
                    quad(1, 0)
                    quad(2, 0)
                }
                HStack {
                    quad(0, 1)
                    quad(1, 1)
                    quad(2, 1)
                }
                HStack {
                    quad(0, 2)
                    quad(1, 2)
                    quad(2, 2)
                }
            }.background(.black)
            
        }
    }
    
    func quad(_ x:Int,_ y:Int) -> some View {
        Quadrado(texto: viewModel.getValor(x, y))
            .padding()
            .background(.white)
            .onTapGesture {
                viewModel.clicou(x, y)
            }
    }
    
}

struct Quadrado: View {
    var texto: String
    var body: some View {
        Text(texto)
            .font(.system(size: 72.0))
            .frame(width: 80,height: 80)
    }
}

struct VelhaView_Previews: PreviewProvider {
    static var previews: some View {
        VelhaView(viewModel: VelhaViewModel())
    }
}
