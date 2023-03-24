//
//  EmojiArtModel.swift
//  Memoria
//
//  Created by Erick Leonardo Weil on 24/03/23.
//

import Foundation

struct EmojiArtModel {
    var background: Background = Background.blank
    var emojis = [Emoji]()
        
    mutating func addEmoji(_ text: String, at location: (x: Int,y: Int), size: Int) {
        emojis.append(Emoji(text: text, x: location.x, y: location.y, size: size))
    }
    
    struct Emoji: Identifiable, Hashable {
        static private var uniqueEmojiId = 0
        let text: String
        var x: Int // offset from the center
        var y: Int
        var size: Int
        let id: Int
        
        init(text: String, x: Int, y: Int, size: Int) {
            self.text = text
            self.x = x
            self.y = y
            self.size = size
            self.id = Emoji.uniqueEmojiId
            Emoji.uniqueEmojiId += 1
        }
    }
    
    enum Background {
        case blank
        case url(URL)
        case imageData(Data)
        
        var url: URL? {
            switch self {
            case .url(let url): return url
            default: return nil
            }
        }
        
        var imageData: Data? {
            switch self {
            case .imageData(let data): return data
            default: return nil
            }
        }
    }
}
