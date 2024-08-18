//
//  CompostingView.swift
//  wasteManagement
//
//  Created by Aknur Seidazym on 06.05.2024.
//

import SwiftUI

struct CompostingView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("composting")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            Text("Composting")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Composting is the natural process of recycling organic material, like kitchen scraps and yard waste, into a valuable soil amendment.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Divider()
            
            Text("Benefits of Composting:")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("1. Enriches soil\n2. Reduces landfill waste\n3. Decreases greenhouse gas emissions\n4. Saves money on soil amendments")
                .font(.body)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Composting", displayMode: .inline)
    }
}


#Preview {
    CompostingView()
}
