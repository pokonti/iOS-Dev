//
//  CardView.swift
//  wasteManagement
//
//  Created by Aknur Seidazym on 09.05.2024.
//

import SwiftUI

struct CardView: View {
    let bonusAmount: Int // Bonus amount to display

    var body: some View {
        Text("Bonus card")
            .font(.title)
            .fontWeight(.bold)
            .padding(.top, 10)
        VStack(alignment: .leading, spacing: 10) {
            Text("Recycling Bonus")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 10)
            
            Text("Earn \(bonusAmount) bonus points for recycling!")
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
            Spacer()
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("CardBackground"))
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        )
        .frame(maxWidth: .infinity)
        .aspectRatio(1.5, contentMode: .fit)
        .padding([.leading, .trailing])
    }
}
