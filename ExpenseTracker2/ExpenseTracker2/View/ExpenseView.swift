//
//  ExpenseView.swift
//  ExpenseTracker2
//
//  Created by Aknur Seidazym on 26.04.2024.
//

import SwiftUI
import SwiftData

struct ExpenseView: View {
    @State var monthlyExpenseAmounts: [Double] = []
    @State private var hasExpenses: Bool = false
    
    /// Grouped Expenses Properties
    @Query(sort: [
        SortDescriptor(\Expense.date, order: .reverse)
    ], animation: .snappy) private var allExpenses: [Expense]
    @Environment(\.modelContext) private var context
    
    /// Grouped Expenses
    @State private var groupedExpenses: [GroupedExpeses] = []
    @State private var addExpense: Bool = false
    var body: some View {
        NavigationStack {
            List {
                GraphView(expenseAmounts: monthlyExpenseAmounts, hasExpenses: hasExpenses)
                ForEach($groupedExpenses) { $group in
                    Section(group.groupTitle) {
                        ForEach(group.expenses) { expense in
                        ///Card View
                        ExpenseCardView(expense: expense)
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    /// Delete Button
                                    Button {
                                        context.delete(expense)
                                        withAnimation {
                                            group.expenses.removeAll(where: { $0.id == expense.id})
                                            if group.expenses.isEmpty {
                                                groupedExpenses.removeAll(where: { $0.id == group.id })
                                            }
                                        }
                                        calculateMonthlyExpenseAmounts()
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                    .tint(.red)
                                }
                        }
                    }
                }
                
            }
            .navigationTitle("Expenses")
            .overlay {
                if allExpenses.isEmpty ||  groupedExpenses.isEmpty {
                    ContentUnavailableView {
                        Label("No Expenses", systemImage: "tray.fill")
                    }
                }
            }
            /// New Expense Add Button
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        addExpense.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title3)
                    }
                }
            }
            .onAppear {
                calculateMonthlyExpenseAmounts()
            }
        }
        .onChange(of: allExpenses, initial: true){ oldValue, newValue in
            if newValue.count > oldValue.count || groupedExpenses.isEmpty {
                createGroupedExpenses(newValue)
            }
        }
        .sheet(isPresented: $addExpense) {
            AddExpenseView()
                .interactiveDismissDisabled()

        }
        
    }
    /// Creating Grouped Expenses (Grouping by Date)
    func createGroupedExpenses(_ expenses: [Expense]) {
        Task.detached(priority: .high) {
            let groupedDict = Dictionary(grouping: expenses) { expense in
                let dateComponents = Calendar.current.dateComponents([.day, .month, .year], from: expense.date)
                return dateComponents
            }
            /// Sorting Dictionary in Descending Order
            let sortedDict = groupedDict.sorted {
                let calendar = Calendar.current
                let date1 = calendar.date(from: $0.key) ?? .init()
                let date2 = calendar.date(from: $1.key) ?? .init()
                
                return calendar.compare(date1, to: date2, toGranularity: .day) == .orderedDescending
            }
            
            /// Adding to the Grouped Expenses Array
            /// UI Must be Updated on Main Thread
            await MainActor.run {
                groupedExpenses = sortedDict.compactMap({ dict in
                    let date = Calendar.current.date(from: dict.key) ?? .init()
                    return .init(date: date, expenses: dict.value)
                })
                calculateMonthlyExpenseAmounts()
            }
        }
        
    }
    

    func calculateMonthlyExpenseAmounts() {
        let calendar = Calendar.current
        let now = Date()
        
        /// Calculate the start date as 30 days before today
        guard let startDate = calendar.date(byAdding: .day, value: -30, to: now) else {
            print("Error: Unable to calculate start date.")
            return
        }
        
        /// Filter expenses for the past 30 days (from startDate to today)
        let filteredExpenses = allExpenses.filter {
            $0.date >= startDate && $0.date <= now
        }
        
        /// Get the number of days within the date range
        guard let numberOfDaysInRange = calendar.dateComponents([.day], from: startDate, to: now).day else {
            return
        }
        
        /// Initialize an array to hold daily expense amounts for the date range
        var dailyExpenseAmounts = Array(repeating: 0.0, count: numberOfDaysInRange + 1) // Include today
        
        /// Accumulate expenses into daily indices based on the day of the expense date
        for expense in filteredExpenses {
            let dayIndex = calendar.dateComponents([.day], from: startDate, to: expense.date).day ?? 0
            if dayIndex >= 0 && dayIndex < dailyExpenseAmounts.count {
                dailyExpenseAmounts[dayIndex] += expense.amount
            }
        }
        
        /// Update monthlyExpenseAmounts and hasExpenses state
        monthlyExpenseAmounts = dailyExpenseAmounts
        hasExpenses = monthlyExpenseAmounts.contains(where: { $0 != 0.0 })
        
        /// Test
//        print("Start Date:", startDate)
//        print("End Date:", now)
//        print("Number of Days in Range:", numberOfDaysInRange + 1)
//        print("Daily Expense Amounts:", dailyExpenseAmounts)
//        print("Monthly Expense Amounts:", monthlyExpenseAmounts)
//        print("Has Expenses:", hasExpenses)
    }
}

#Preview {
    ExpenseView()
}
