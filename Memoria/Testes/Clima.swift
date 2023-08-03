//
//  ExperimentosSwiftUI.swift
//  Teste
//
//  Created by Erick Leonardo Weil on 01/08/23.
//

import SwiftUI

struct Clima: View {
    @State var estaNoite = false
    
    var body: some View {
            ZStack {
                BackgroundView(
                    corInicial: estaNoite ? Color.black : Color("fundoAzul"),
                    corFinal: Color(red:0.6,green:0.8,blue:0.9)
                )
                
                VStack {
                    Text("Nova Brasilândia do Oeste, RO")
                        .bold()
                        .font(.title2)
                    
                    VStack {
                        
                        Image(systemName: "cloud.rain.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180.0,height: 180.0)
                        
                        Text("25º")
                            .font(.system(size: 70, weight: .medium))
                        
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 26) {
                        ClimaDiaView(dia: "SEG", img: "cloud.bolt.rain.fill", temp: 20)
                        ClimaDiaView(dia: "TER", img: "cloud.rain.fill", temp: 22)
                        ClimaDiaView(dia: "QUA", img: "cloud.sun.rain.fill", temp: 29)
                        ClimaDiaView(dia: "QUI", img: "cloud.sun.fill", temp: 32)
                        ClimaDiaView(dia: "SEX", img: "sun.max.fill", temp: 40)
                    }.padding()
                    
                    Spacer()
                    
                    Button {
                        estaNoite = !estaNoite
                    } label: {
                        Text("Mudar para Noite")
                            .frame(width: 280, height: 50)
                            .background(Color.white)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                    }
                                        
                }
                .padding(.bottom,40)
            }
            .foregroundColor(.white)
    }
}

struct ClimaDiaView: View {
    
    var dia: String
    var img: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(dia)
                .font(.system(size: 20, weight: .medium))
            
            Image(systemName: img)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40.0,height: 40.0)
            
            Text("\(temp)")
                .font(.system(size: 28, weight: .medium))
        }
    }
}

struct BackgroundView: View {
    var corInicial: Color
    var corFinal: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [corInicial, corFinal]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ExperimentosSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        Clima()
    }
}
