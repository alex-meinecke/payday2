//
//  TripView.swift
//  payday2
//
//  Created by Meinecke, Alexander on 17.08.24.
//

import SwiftUI

struct TripView: View {
    
        enum CostOverview: String, CaseIterable, Identifiable {
            case expenses, balaces
            var id: Self { self }
        }

    @State private var selectedCostOverview: CostOverview = .expenses
    
    
    var body: some View {
        VStack(alignment: .center){
            Text("💸")
                .font(.largeTitle)
            Text("Title")
                .font(.largeTitle)
                .bold()
            
            
                Picker("Cost Overview", selection: $selectedCostOverview) {
                    Text("Expenses").tag(CostOverview.expenses)
                    Text("Balances").tag(CostOverview.balaces)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                ExpenseViews

                
                if selectedCostOverview == CostOverview.expenses {
                    List {
                        createExpenseRow(emoji: "💸", subject: "iPhone 15 Pro", name: "Alex", amount: 1050.23, currencyCode: "US$")
                        createExpenseRow(emoji: "🛒", subject: "Wallmart", name: "Jens", amount: 1050.23, currencyCode: "US$")
                        createExpenseRow(emoji: "💸", subject: "iPhone 15 Pro", name: "Alex", amount: 1050.23, currencyCode: "US$")
                        createExpenseRow(emoji: "💸", subject: "iPhone 15 Pro", name: "Alex", amount: 1050.23, currencyCode: "US$")
                    }
                } else if selectedCostOverview == CostOverview.balaces {
                    List {
                        createBalanceRow(name: "Alex", amount: 1050.23, currencyCode: "US$")
                        createBalanceRow(name: "Ben", amount: -50.23, currencyCode: "US$")
                        createBalanceRow(name: "Jacob", amount: -3.32, currencyCode: "US$")
                        createBalanceRow(name: "Tina", amount: 82.23, currencyCode: "US$")
                    }
                }
                
            Image(systemName: "plus.circle.dashed")
                .font(.system(size: 50))
                .padding()
                .onTapGesture {
                    withAnimation {
                        print("tapped")
                    }
                    
                }
            }
            
            
            
            
            
            
                
            
            
        }
    }



@ViewBuilder
var ExpenseViews: some View {
    
    HStack() {
        createExpenseView(caption: "My Expenses",
                          amount: 632.34, currencyCode: "US$")
        
        createExpenseView(caption: "Total Expenses", amount: 2453.38, currencyCode: "US$")
    }
}


func createExpenseView(caption: String, amount: Double, currencyCode: String) -> some View {
    var expenseView: some View {

        
            return HStack() {
            VStack(alignment: .center){
                Text(caption)
                    .font(.footnote)
                    .foregroundStyle(.gray)
                createCurrencyTextField(amount: amount, currencyCode: currencyCode).bold()
            }.padding()
                    .contentTransition(.numericText(value: amount))
                
            
        }
    }
    
    return expenseView
}


func createExpenseRow(emoji: Character, subject: String, name: String, amount: Double, currencyCode: String) -> some View {
    
    
    var expenseRow: some View {
        HStack{
            Text(String(emoji))
            VStack(alignment: .leading){
                Text(subject)
                    .font(.headline)
                Text("Paid by \(name)")
                    .font(.subheadline)
            }
            Spacer()
            createCurrencyTextField(amount: amount, currencyCode: currencyCode)
                .bold()
                .font(.title3)
            
        }
    }
    
    return expenseRow
}

func createBalanceRow(name: String, amount: Double, currencyCode: String) -> some View {
    
    
    var expenseRow: some View {
        HStack{
            Image(systemName: "person.circle.fill")
                .font(.largeTitle)
            Text(name)
            Spacer()
            createCurrencyTextField(amount: amount, currencyCode: currencyCode)
                .bold()
                .font(.title3)
                .foregroundStyle(amount < 0 ? .red : .green)
            
        }
    }
    
    return expenseRow
}

func createCurrencyTextField(amount: Double, currencyCode: String) -> Text {
    return Text("\(Double(amount).formatted(.currency(code: currencyCode))) \(currencyCode)")
}


#Preview {
    TripView()
}
