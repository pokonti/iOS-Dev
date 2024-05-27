//
//  ExpenseTracker2App.swift
//  ExpenseTracker2
//
//  Created by Aknur Seidazym on 26.04.2024.
//

import SwiftUI

@main
struct ExpenseTracker2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        /// Setting Up the Container
        .modelContainer(for: [Expense.self, Category.self])
    }
}
