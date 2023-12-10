//
//  ContentView.swift
//  GroceryShop
//
//  Created by Tekla Matcharashvili on 10.12.23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = GroceryStoreViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.products) { product in
                    ProductView(product: product, viewModel: viewModel)
                }
                
                HStack {
                    Button("Apply 20% Discount") {
                        viewModel.discount = 20.0
                        viewModel.applyDiscount()
                    }
                    Spacer()
                    NavigationLink(destination: CartView(viewModel: viewModel)) {
                        Text("Cart")
                    }
                }
                .padding()
            }
            .navigationTitle("Grocery Store")
        }
    }
}
