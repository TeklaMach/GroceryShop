//
//  File.swift
//  GroceryShop
//
//  Created by Tekla Matcharashvili on 10.12.23.
//

import SwiftUI

struct ProductView: View {
    var product: Product
    @ObservedObject var viewModel: GroceryStoreViewModel
    
    var body: some View {
        HStack {
            Image(product.image)
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(product.name)
                Text("Price: $\(product.price, specifier: "%.2f")")
            }
            Spacer()
            VStack {
                Text("Qty: \(product.quantity)")
                HStack {
                    Button("-") {
                        viewModel.decreaseQuantity(for: product)
                    }
                    .buttonStyle(BorderedButtonStyle())
                    Button("+") {
                        viewModel.increaseQuantity(for: product)
                    }
                    .buttonStyle(BorderedButtonStyle())
                    Button("X") {
                        viewModel.deleteProduct(product)
                    }
                    .buttonStyle(BorderedButtonStyle())
                }
            }
        }
        .padding()
        .disabled(!product.inStock)
    }
}
