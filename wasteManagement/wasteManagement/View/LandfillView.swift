//
//  LandfillView.swift
//  wasteManagement
//
//  Created by Aknur Seidazym on 06.05.2024.
//

import SwiftUI

struct LandfillView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("landfill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            Text("Landfill")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Landfill disposal involves burying waste in the ground. Properly managed landfills can be a safe and effective method of waste disposal.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Divider()
            
            Text("Challenges of Landfills:")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("1. Space requirements\n2. Leachate and methane production\n3. Potential groundwater contamination\n4. Long-term environmental impact")
                .font(.body)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Landfill", displayMode: .inline)
    }
}

#Preview {
    LandfillView()
}
