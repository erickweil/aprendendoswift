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
            // O resultado funciona como Spacer
            viewResultado
            
            viewTeclado
        }
        .padding()
        
    }
    
    var viewResultado: some View {
        ZStack (alignment: .trailing) {
            VStack (alignment: .trailing) {
                Text(viewModel.exprTxt).font(.title).opacity(0.8)
                Text(viewModel.resultado).font(.largeTitle)
            }
            .padding()
            
            RoundedRectangle(cornerRadius: 15.0)
                .stroke(lineWidth: 4)
                .foregroundColor(.primary)
        }
    }
    
    var viewTeclado: some View {
        //  7   8   9
        //  4   5   6
        //  1   2   2
        //  .     0
        LazyVGrid(columns: [
            GridItem(.flexible(),spacing:0.0),
            GridItem(.flexible(),spacing:0.0),
            GridItem(.flexible(),spacing:0.0),
            GridItem(.flexible(),spacing:0.0)],spacing: 0.0)  {
            
            Group {
                Spacer()
                Spacer()
                Spacer()
                btnNumero(.del)
            }
            
            Group {
                btnNumero(.c)
                btnNumero(.par)
                btnNumero(.mod)
                btnNumero(.div)
            }

            Group {
                btnNumero(.n7)
                btnNumero(.n8)
                btnNumero(.n9)
                btnNumero(.mul)
            }
            
            Group {
                btnNumero(.n4)
                btnNumero(.n5)
                btnNumero(.n6)
                btnNumero(.sub)
            }

            Group {
                btnNumero(.n1)
                btnNumero(.n2)
                btnNumero(.n3)
                btnNumero(.add)
            }
            
            Group {
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
            },label:{
                ZStack {
                    Text("\(num.rawValue)")
                        .font(.title)
                    
                    RoundedRectangle(cornerRadius: 5.0)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.secondary)
                }
                .aspectRatio(1.0/1.0, contentMode: .fit)
                
            })
            .foregroundColor(Color.primary)
        //
    }
}



// Configura o Preview.
struct CalculadoraView_Previews: PreviewProvider {
    static var previews: some View {
        CalculadoraView(viewModel:CalculadoraViewModel())
    }
}

