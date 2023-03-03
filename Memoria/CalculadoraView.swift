//
//  CalculadoraView.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 01/03/23.
//
import SwiftUI

// Define o que irá aparecer na Tela
// struct não são classes, não tem herança
// servem para programação funcional
struct CalculadoraView: View {
    
    
    @ObservedObject
    var viewModel: CalculadoraViewModel
    
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View /* () */{
        // View que Une várias views uma em cima da outra
        
        VStack {
            viewResultado
            
            viewTeclado
            
            Spacer()
        }
        
    }
    
    var viewResultado: some View {
        VStack {
            Text(viewModel.exprTxt).font(.title).opacity(0.8)
            Text(viewModel.resultado).font(.largeTitle)
        }
        .frame(width: 280,height: 80.0)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(lineWidth: 6)
                .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
        )
    }
    
    var viewTeclado: some View {
        //  7   8   9
        //  4   5   6
        //  1   2   2
        //  .     0
        VStack {
            HStack {
                Spacer()
                btnNumero(.del)
            }
            HStack {
                btnNumero(.c)
                btnNumero(.par)
                btnNumero(.mod)
                btnNumero(.div)
            }
            HStack {
                btnNumero(.n7)
                btnNumero(.n8)
                btnNumero(.n9)
                btnNumero(.mul)
            }
            HStack {
                btnNumero(.n4)
                btnNumero(.n5)
                btnNumero(.n6)
                btnNumero(.sub)
            }
            HStack {
                btnNumero(.n1)
                btnNumero(.n2)
                btnNumero(.n3)
                btnNumero(.add)
            }
            
            HStack {
                btnNumero(.neg)
                btnNumero(.n0)
                btnNumero(.dot)
                btnNumero(.eq)
            }
        }
    }
    
    private func btnNumero(_ num: CalculadoraViewModel.Botoes) -> some View {
        Button(action:{
            viewModel.clickButton(num)
        },label:{Text("\(num.rawValue)")})
        .foregroundColor(Color.primary)
        .font(.title)
        .frame(width: 40.0,height: 60.0)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(lineWidth: 6)
                .foregroundColor(.secondary)
        )
    }
}



// Configura o Preview.
struct CalculadoraView_Previews: PreviewProvider {
    static var previews: some View {
        CalculadoraView(viewModel:CalculadoraViewModel())
    }
}

