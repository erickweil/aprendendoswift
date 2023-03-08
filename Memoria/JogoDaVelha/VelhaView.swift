//
//  VelhaView.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 08/03/23.
//


import SwiftUI

// Define o que irá aparecer na Tela
// struct não são classes, não tem herança
// servem para programação funcional
struct VelhaView: View {
    
    var viewModel: VelhaViewModel
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View /* () */{
        // View que Une várias views uma em cima da outra
        
        let lineWidth = 4.0
        VStack {
            Spacer()
            VStack(spacing: lineWidth) {
                HStack(spacing: lineWidth) {
                    QuadradoView(x:0,y:0,viewModel: viewModel)
                    QuadradoView(x:1,y:0,viewModel: viewModel)
                    QuadradoView(x:2,y:0,viewModel: viewModel)
                }
                HStack(spacing: lineWidth) {
                    QuadradoView(x:0,y:1,viewModel: viewModel)
                    QuadradoView(x:1,y:1,viewModel: viewModel)
                    QuadradoView(x:2,y:1,viewModel: viewModel)
                }
                HStack(spacing: lineWidth) {
                    QuadradoView(x:0,y:2,viewModel: viewModel)
                    QuadradoView(x:1,y:2,viewModel: viewModel)
                    QuadradoView(x:2,y:2,viewModel: viewModel)
                }
            }.background {
                Rectangle().fill(Color.black)
            }.padding(24.0)
            Spacer()
        }
    }
    
}

struct QuadradoView: View {
    var x: Int
    var y: Int
    
    @ObservedObject
    var viewModel: VelhaViewModel
    
    var body: some View {
        
        let estado: VelhaModel.Mark = viewModel.at(x, y)
        
        let btnClick = {
            viewModel.doMarking(x, y)
        }
        
        Button(action:btnClick) {
            GeometryReader { geo in
                let shape = Rectangle().fill(Color.white)
                    
                // 0 --> Vazio
                // 1 --> X
                // 2 --> O
                if estado == .empty {
                    shape
                }
                else {
                    shape.overlay {
                        if estado == .X {
                            VelhaSimbolos.Xis().fill()
                        } else {
                            VelhaSimbolos.Bolinha().fill()
                        }
                    }
                }
            }
        }
        .foregroundColor(.black)
        .aspectRatio(1.0, contentMode: .fit)
    }
}



// Configura o Preview.
struct VelhaView_Previews: PreviewProvider {
    static var previews: some View {
        VelhaView(viewModel:VelhaViewModel())
    }
}
