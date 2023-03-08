//
//  VelhaView.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 08/03/23.
//


import SwiftUI

struct VelhaView: View {
    
    @ObservedObject
    var viewModel: VelhaViewModel
    
    var body: some View {
        let lineWidth = 4.0
        VStack {
            Spacer()
            VStack(spacing: lineWidth) {
                HStack(spacing: lineWidth) {
                    QuadradoView(estado:viewModel.at(0, 0)).onTapGesture { onSquareClick(0,0) }
                    QuadradoView(estado:viewModel.at(1, 0)).onTapGesture { onSquareClick(1,0) }
                    QuadradoView(estado:viewModel.at(2, 0)).onTapGesture { onSquareClick(2,0) }
                }
                HStack(spacing: lineWidth) {
                    QuadradoView(estado:viewModel.at(0, 1)).onTapGesture { onSquareClick(0,1) }
                    QuadradoView(estado:viewModel.at(1, 1)).onTapGesture { onSquareClick(1,1) }
                    QuadradoView(estado:viewModel.at(2, 1)).onTapGesture { onSquareClick(2,1) }
                }
                HStack(spacing: lineWidth) {
                    QuadradoView(estado:viewModel.at(0, 2)).onTapGesture { onSquareClick(0,2) }
                    QuadradoView(estado:viewModel.at(1, 2)).onTapGesture { onSquareClick(1,2) }
                    QuadradoView(estado:viewModel.at(2, 2)).onTapGesture { onSquareClick(2,2) }
                }
            }.background {
                Rectangle().fill(Color.black)
            }.padding(24.0)
            
            Spacer()
            if let whoWon = viewModel.whoWon {
                if whoWon == .X {
                    Text("'X' ganhou!").font(.largeTitle)
                } else {
                    Text("'O' ganhou!").font(.largeTitle)
                }
            } else {
                Text(" ").font(.largeTitle)
            }
        }
    }
    
    func onSquareClick(_ x:Int, _ y:Int) {
        viewModel.doMarking(x, y)
    }
}

struct QuadradoView: View {
    let estado: VelhaModel.Mark
    
    var body: some View {
        let shape = Rectangle()
        .fill(Color.white)
        .foregroundColor(.black)
        .aspectRatio(1.0, contentMode: .fit)

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

// Configura o Preview.
struct VelhaView_Previews: PreviewProvider {
    static var previews: some View {
        VelhaView(viewModel:VelhaViewModel())
    }
}
