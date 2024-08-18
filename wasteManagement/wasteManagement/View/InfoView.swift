//
//  InfoView.swift
//  wasteManagement
//
//  Created by Aknur Seidazym on 06.05.2024.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    NavigationLink(destination: RecyclingView()) {
                        InfoCard(imageName: "recycling", title: "Recycling", description: "Recycling is the process of converting waste materials into reusable objects.")
                    }
                    NavigationLink(destination: CompostingView()) {
                        InfoCard(imageName: "composting", title: "Composting", description: "Composting is the natural process of recycling organic material, like kitchen scraps and yard waste, into a valuable soil amendment.");
                    }
                    NavigationLink(destination: IncinerationView()) {
                        InfoCard(imageName: "incineration", title: "Incineration", description: "Incineration is a waste treatment process that involves the combustion of organic substances contained in waste materials.");
                    }
                    NavigationLink(destination: LandfillView()) {
                        InfoCard(imageName: "landfill", title: "Landfill", description: "Landfill disposal involves burying waste in the ground. Properly managed landfills can be a safe and effective method of waste disposal.");
                    }
                }
                .padding()
            }
            .navigationTitle("Waste Disposal Methods")
        }
    }
}

struct InfoCard: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(10)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            
            Text(description)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

#Preview {
    InfoView()
}
