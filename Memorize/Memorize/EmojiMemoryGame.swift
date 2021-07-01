//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by cynber on 6/30/21.
//

// Part of the UI
import SwiftUI

// Object Oriented
class EmojiMemoryGame {
    // essentially global but within class scope
    // type variable (type itself have this
    static let emojis = ["🚊", "🚞", "🚆", "🚃", "🚅", "🚂", "🚇", "🚋", "🚚", "🚛", "🛫", "🛺", "🚐", "🚜"]
    
    // type function (function on the very type and not instances)
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsofCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private(set) var model: MemoryGame<String> = createMemoryGame()
    
//    // Other classes can look, but cannot change
//    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsofCards: 4) { pairIndex in
//        // Error: Cannot use instance member 'emojis' within property initializer; property initializers run before 'self' is available
//        // Can't call emojis during a property initializer, so can't depend on another initializers since order is randomly initialized and emojis may not be initialized
//        // Solution = create init with assignment in right order OR use constant
//        EmojiMemoryGame.emojis[pairIndex]
//    }
    
    // Read only and views can call this
    // Past structs around we get a copy
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
