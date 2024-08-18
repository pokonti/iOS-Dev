//
//  BonusView.swift
//  wasteManagement
//
//  Created by Aknur Seidazym on 09.05.2024.
//

import SwiftUI

struct BonusView: View {
    @State private var bonusCode: String = ""
    var body: some View {
        VStack(spacing: 20) {
            CardView(bonusAmount: 50) 
            
            Spacer()
            
            TextField("Enter bonus code", text: $bonusCode)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                .foregroundColor(.primary)
          
            
                Button(action: {
                    sendBonusCode()
                }) {
                    Text("Send")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("CardBackground"))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
    
        }
        .navigationBarTitle("Recycling Bonuses")
    }
    
    private func sendBonusCode() {
           print("Sending bonus code: \(bonusCode)")
        
           
    }
}

#Preview {
    BonusView()
}
