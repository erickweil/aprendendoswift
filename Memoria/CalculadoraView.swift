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
    // Ao implementar uma view, deve prover uma variável body
    // que se comporta como uma View
    var body: some View /* () */{
        // View que Une várias views uma em cima da outra
        
        VStack {
            viewResultado
            
            viewTeclado
        }
        
    }
    
    var viewResultado: some View {
        HStack {
            Text("1 + 1 = ")
            
            Text("2")
        }
        .frame(maxWidth: .infinity)        
        .overlay(
            RoundedRectangle(cornerRadius: 25.0)
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
                btnNumero("7")
                btnNumero("8")
                btnNumero("9")
            }
            HStack {
                btnNumero("4")
                btnNumero("5")
                btnNumero("6")
            }
            
            HStack {
                btnNumero("1")
                btnNumero("2")
                btnNumero("3")
            }
            HStack {
                btnNumero(" ")
                btnNumero(".")
                btnNumero("0")
            }
        }
    }
    
    private func btnNumero(_ num:String) -> some View {
        Button(action:{},label:{Text("\(num)")})
        .foregroundColor(Color.blue)
        .font(.largeTitle)
        .frame(width: 60.0,height: 80.0)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: 6)
                .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
        )
    }
}



// Configura o Preview.
struct CalculadoraView_Previews: PreviewProvider {
    static var previews: some View {
        CalculadoraView()
    }
}

