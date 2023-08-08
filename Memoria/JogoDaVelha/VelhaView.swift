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
