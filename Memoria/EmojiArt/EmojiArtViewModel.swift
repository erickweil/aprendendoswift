//
//  EmojiArtViewModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 24/03/23.
//

import SwiftUI

class EmojiArtViewModel: ObservableObject {
    @Published
    private(set) var emojiArt: EmojiArtModel
    
    init() {
        emojiArt = EmojiArtModel()
        //let dist = 100
        //emojiArt.addEmoji("1️⃣", at: (-dist,-dist), size: 80)
        //emojiArt.addEmoji("2️⃣", at: (-dist,dist), size: 80)
        //emojiArt.addEmoji("3️⃣", at: (dist,-dist), size: 80)
        //emojiArt.addEmoji("4️⃣", at: (dist,dist), size: 80)
    }
    
    var emojis: [EmojiArtModel.Emoji] { emojiArt.emojis }
    var background: EmojiArtModel.Background { emojiArt.background }
    
    func setBackground(_ background: EmojiArtModel.Background) {
        emojiArt.background = background
    }
    
    func addEmoji(_ emoji: String, at location: (x:Int, y:Int), size: CGFloat) {
        emojiArt.addEmoji(emoji, at: location, size: Int(size))
    }
    
    func moveEmoji(_ emoji: EmojiArtModel.Emoji, by offset: CGSize) {
        if let index = emojiArt.emojis.index(matching: emoji) {
            emojiArt.emojis[index].x += Int(offset.width)
            emojiArt.emojis[index].y += Int(offset.height)
        }
    }
    
    func scaleEmoji(_ emoji: EmojiArtModel.Emoji, by scale: CGFloat) {
        if let index = emojiArt.emojis.index(matching: emoji) {
            emojiArt.emojis[index].size = Int((CGFloat(emojiArt.emojis[index].size) * scale).rounded(.toNearestOrAwayFromZero))
        }
    }
}
