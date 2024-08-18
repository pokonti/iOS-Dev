//
//  IncinerationView.swift
//  wasteManagement
//
//  Created by Aknur Seidazym on 06.05.2024.
//

import SwiftUI

struct IncinerationView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("incineration")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            Text("Incineration")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Incineration is a waste treatment process that involves the combustion of organic substances contained in waste materials.")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Divider()
            
            Text("Environmental Impact:")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("1. Reduces waste volume\n2. Generates electricity\n3. Requires proper emission controls\n4. Produces ash and air pollutants")
                .font(.body)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Incineration", displayMode: .inline)
    }
}


#Preview {
    IncinerationView()
}
