//
//  RecyclingView.swift
//  wasteManagement
//
//  Created by Aknur Seidazym on 06.05.2024.
//

import SwiftUI

struct RecyclingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("recycling")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            Text("Recycling")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Recycling is the process of converting waste materials into reusable objects.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Divider() // Add a divider for separation
            
            Text("Types of Recycling:")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("1. Paper recycling\n2. Plastic recycling\n3. Glass recycling\n4. Metal recycling")
                .font(.body)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            Spacer() // Add spacer at the end for better layout
        }
        .padding()
        .navigationBarTitle("Recycling", displayMode: .inline)
    }
}



#Preview {
    RecyclingView()
}
