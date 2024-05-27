//
//  GraphView.swift
//  ExpenseTracker2
//
//  Created by Aknur Seidazym on 30.04.2024.
//

import SwiftUI
import SwiftUICharts

struct GraphView: View {
    var expenseAmounts: [Double]
    var hasExpenses: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Overview")
                .font(.title)
                .bold()
            
            if hasExpenses {
                CardView {
                    VStack {
                        Text("Total Amount Spent:")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text("\(totalSpentFormatted)")
                            .font(.title)
                            .bold()
                            .foregroundColor(.blue)
                    }
                    .padding()
                    BarChart()

                }
                .data(expenseAmounts)
                .chartStyle(ChartStyle(backgroundColor: .white, foregroundColor: ColorGradient(.blue, .categoryName)))
                
                .frame(height: 350)
            } else {
                Text("No expense data for the last month.")
                    .foregroundColor(.gray)
            }
            
        }
        .padding()
    }
    
    private var totalSpentFormatted: String {
            let total = expenseAmounts.reduce(0, +)
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            return formatter.string(for: total) ?? "$0.00"
    }
}
