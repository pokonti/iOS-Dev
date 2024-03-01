//
//  EmojiMemoryGame.swift
//  memo
//
//  Created by Aknur Seidazym on 29.02.2024.
//
// ViewModel
import Foundation

class EmojiMemoryGame: ObservableObject{
    private static let emojis = ["🍑","🍏", "🫐", "🍇","🍉", "🍓"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 6) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle(){
        model.shuffle()
        objectWillChange.send()
    }
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
