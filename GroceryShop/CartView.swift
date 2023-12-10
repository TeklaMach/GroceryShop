//
//  CartView.swift
//  GroceryShop
//
//  Created by Tekla Matcharashvili on 10.12.23.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: GroceryStoreViewModel
    
    var body: some View {
        let totalValue = viewModel.products
            .filter { $0.quantity > 0 }
            .map { Double($0.quantity) * $0.price }
            .reduce(0, +)
        
        return List(viewModel.products.filter { $0.quantity > 0 }) { product in
            HStack {
                Text("\(product.name) - \(product.quantity) x $\(product.price, specifier: "%.2f")")
                Spacer()
                Text("$\(Double(product.quantity) * product.price, specifier: "%.2f")")
            }
        }
        .navigationTitle("Cart")
        .overlay(
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Total: $\(totalValue, specifier: "%.2f")")
                        .font(.headline)
                        .padding()
                }
            }
        )
    }
}
