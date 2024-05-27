//
//  ContentView.swift
//  ExpenseTracker2
//
//  Created by Aknur Seidazym on 26.04.2024.
//

import SwiftUI
import SwiftUIFontIcon

struct ContentView: View {
    /// View Properties
    @State private var currentTab: String = "Expenses"
    var body: some View {
        TabView(selection: $currentTab) {
            ExpenseView()
                .tag("Expenses")
                .tabItem {
                    Image(systemName: "creditcard.fill")
                    Text("Expenses")
                }
            CategoryView()
                .tag("Categories")
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.fill")
                    Text("Categories")
                }
        }
    }
}

#Preview {
    ContentView()
}

