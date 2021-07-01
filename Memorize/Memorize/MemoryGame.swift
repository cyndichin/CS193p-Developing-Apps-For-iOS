//
//  MemoryGame.swift
//  Memorize
//
//  Created by cynber on 6/30/21.
//

import Foundation

// Announce "Don't Care" to the world
struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    // Lose free init when giving struct an actual init
    init(numberOfPairsofCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 to cards array
        for pairIndex in 0..<numberOfPairsofCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    // Clear that card belongs to Memory Game
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent // "Don't Care" type
    }
}
