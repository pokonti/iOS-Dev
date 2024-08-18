//
//  ExchangeListView.swift
//  wasteManagement
//
//  Created by Aknur Seidazym on 09.05.2024.
//

import SwiftUI

struct ExchangeListView: View {
    let exchangeItems: [ExchangeItem] = [
        ExchangeItem(name: "Reusable Water Bottle", description: "Stay hydrated and eco-friendly!", imageName: "water_bottle", price: 100),
        ExchangeItem(name: "Tote Bag", description: "Reduce plastic waste with a reusable tote bag.", imageName: "tote_bag", price: 200),
        ExchangeItem(name: "Coffee Mug", description: "Enjoy your favorite drink sustainably.", imageName: "coffee_mug", price: 150),
        ExchangeItem(name: "Gift Voucher", description: "Treat yourself with a special reward.", imageName: "gift_voucher", price: 180)
        // Add more items as needed
    ]

    var body: some View {
        NavigationStack {
            List(exchangeItems) { item in
                ExchangeListItemView(item: item)
                    .padding(.vertical, 8)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Offers")
        }
        
    }
}

struct ExchangeListItemView: View {
    let item: ExchangeItem

    var body: some View {
        HStack(spacing: 16) {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 120)
                .cornerRadius(12)
            
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true) // Allow multiline description
                
                Text(item.amountOfBonus)
                    .font(.headline)
                    .foregroundColor(.primary)
                
             
            }
            .padding(.trailing, 8)

            Spacer()
        }
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
    }
}

struct ExchangeItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let imageName: String
    let price: Int
    
    var amountOfBonus: String {
        return "\(price)"
    }
}

