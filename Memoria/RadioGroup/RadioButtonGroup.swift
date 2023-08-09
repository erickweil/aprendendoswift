//
//  RadioButtonGroup.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 08/08/23.
//

import SwiftUI
//MARK:- Group of Radio Buttons
struct RadioButtonGroups: View {
    var opcoes: [String]
    let callback: (String) -> ()
    
    @State var selectedId: String = ""
    
    var body: some View {
        VStack {
            ForEach(opcoes, id: \.self) { str in
                RadioButtonField(
                    id: str,
                    label: str,
                    isMarked: selectedId == str ? true : false,
                    callback: radioGroupCallback
                )
            }
        }
    }
        
    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}
