//
//  MemoryGame.swift
//  memo
//
//  Created by Aknur Seidazym on 29.02.2024.
//
// Model
import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card> //only looking at this variable is allowed //access control
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    func choose(card: Card){
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
    }
}
