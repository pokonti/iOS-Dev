//
//  ContentView.swift
//  memo
//
//  Created by Aknur Seidazym on 23.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View { //computed property
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView(isFaceUp: true)
        } //bouilding tuple
        
        
        .foregroundColor(Color.yellow)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack(alignment: .center) {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 18)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 18)
                    .strokeBorder(lineWidth: 2)
                Text("👾").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 18)
            }
            
        }
    }
}
#Preview {
    ContentView()
}
