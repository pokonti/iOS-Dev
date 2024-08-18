//
//  wasteManagementApp.swift
//  wasteManagement
//
//  Created by Aknur Seidazym on 06.05.2024.
//

import SwiftUI
import Firebase
@main
struct wasteManagementApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
