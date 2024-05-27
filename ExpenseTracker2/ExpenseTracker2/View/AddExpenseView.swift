//
//  AddExpenseView.swift
//  ExpenseTracker2
//
//  Created by Aknur Seidazym on 26.04.2024.
//

import SwiftUI
import SwiftData

struct AddExpenseView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    /// View Properties
    @State private var title: String = ""
    @State private var subTitle: String = ""
    @State private var date: Date = .init()
    @State private var amount: CGFloat = 0
    @State private var category: Category?
    /// Categories
    @Query(animation: .snappy) private var allCategories: [Category]

    var body: some View {
        NavigationStack {
            List {
                Section("Title") {
                    TextField("Product Name", text: $title)
                }
                
                Section("Description") {
                    TextField("Bought...", text: $subTitle)
                }
                Section("Amount Spent") {
                    HStack(spacing: 4){
                        Text("KZT")
                        TextField("0.0", value: $amount, formatter: formatter)
                            .keyboardType(.numberPad)
                    }
                    
                }
                
                
                /// Category Picker
                if !allCategories.isEmpty {
                    HStack {
                        Text("Category")
                        
                        Spacer()
                        
                        Menu {
                            ForEach(allCategories) { category in
                                Button(category.categoryName){
                                    self.category = category
                                }
                            }
                            
                            /// None button
                            Button("None"){
                                category = nil
                            }
                        } label: {
                            if let categoryName = category?.categoryName {
                                Text(categoryName)
                            } else {
                                Text("None")
                            }
                        }
                    }
                }
                
                Section("Date") {
                    DatePicker("", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                }
            }
            .navigationTitle("Add Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                /// Cancel and Add Button
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(.red)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", action: addExpense)
                        .disabled(isAddButtonDisabled)
                }
            }
        }
    }
    /// Disabling Add button, until all data has been entered
    var isAddButtonDisabled: Bool {
        return title.isEmpty || subTitle.isEmpty || amount == .zero
    }
    /// Adding Expense to the Swift Data
    func addExpense(){
        let expense = Expense(title: title, subTitle: subTitle, amount: amount, date: date, category: category)
        context.insert(expense)
        dismiss()
    }
    
    /// Decimal Formatter
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

#Preview {
    AddExpenseView()
}
