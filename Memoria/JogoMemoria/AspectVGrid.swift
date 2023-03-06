//
//  AspectVGrid.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 06/03/23.
//

import SwiftUI

struct AspectVGrid<Item,ItemView>: View where ItemView: View, Item: Identifiable {
    var items: [Item]
    var aspectRatio: CGFloat
    var padding: CGFloat
    var content: (Item) -> ItemView
    
    
    // Para aceitar ViewBuilders precisa de um init
    init(items: [Item], aspectRatio: CGFloat, padding: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.padding = padding
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                let width: CGFloat = calcWidth(itemCount: items.count, in: geometry.size, itemAspectRatio: aspectRatio)
                LazyVGrid(columns: [zeroSpaceItem(width:width)], spacing: 0) {
                    ForEach(items) { item in
                        content(item).aspectRatio(aspectRatio, contentMode: .fit)
                            .padding(padding)
                    }
                }
                
                // Faz ser 'flexível'
                Spacer(minLength: 0)
            }
        }
    }
    
    private func zeroSpaceItem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    private func calcWidth(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
        var nColunas = 1
        var nLinhas = itemCount
        // Iterativamente aumenta o número de colunas até caber todas as cartas
        repeat {
            let itemWidth = size.width / CGFloat(nColunas)
            let itemHeight = itemWidth / itemAspectRatio
            if CGFloat(nLinhas) * itemHeight < size.height {
                break
            }
            nColunas += 1
            nLinhas = (itemCount + (nColunas - 1)) / nColunas
        } while nColunas < itemCount
        
        if nColunas > itemCount {
            nColunas = itemCount
        }
        
        return floor(size.width / CGFloat(nColunas))
    }
}

/*
struct AspectVGrid_Previews: PreviewProvider {
    static var previews: some View {
        
        AspectVGrid()
    }
}
*/
