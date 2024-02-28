//
//  ContentView.swift
//  memo
//
//  Created by Aknur Seidazym on 23.02.2024.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🍑","🍏", "🫐", "🍇","🍏","🍉", "🍓", "🍓"]
    
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView{
                cards
            }
            
            Spacer()
            cardCountAdjuster
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid (columns: [GridItem(.adaptive(minimum: 150))]) {
            ForEach(0..<cardCount, id: \.self) { index in // emojis.indices = 0..<4
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(Color.yellow)
    }
    
    var cardCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }.imageScale(.large)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
         cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "minus.square")
    }
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "plus.square")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false //temporary state
    
    var body: some View {
        ZStack(alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 15)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }.onTapGesture { //clicking it
            isFaceUp.toggle() // == isFaceUp = !isFaceUp
        }
    }
}
#Preview {
    ContentView()
}
