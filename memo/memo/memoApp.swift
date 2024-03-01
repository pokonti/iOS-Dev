//
//  memoApp.swift
//  memo
//
//  Created by Aknur Seidazym on 23.02.2024.
//

import SwiftUI

@main
struct memoApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
