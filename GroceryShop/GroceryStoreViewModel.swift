//
//  GroceryStoreViewModel.swift
//  GroceryShop
//
//  Created by Tekla Matcharashvili on 10.12.23.
//

import SwiftUI
import Combine

class GroceryStoreViewModel: ObservableObject {
    @Published var products: [Product] = [
        Product(name: "Apple", quantity: 0, price: 1.0, image: "apple"),
        Product(name: "Banana", quantity: 0, price: 0.5, image: "banana"),
        Product(name: "Avocado", quantity: 0, price: 3.5, image: "avocado"),
        Product(name: "Strawberry", quantity: 0, price: 5.0, image: "strawberry"),
        Product(name: "Cononut", quantity: 0, price: 4.2, image: "coconut"),
        Product(name: "Pineapple", quantity: 0, price: 1.9, image: "pineapple"),
        Product(name: "Mango", quantity: 0, price: 6.0, image: "mango"),
    ]
    
    @Published var discount: Double = 0.0
    
    func increaseQuantity(for product: Product) {
        guard product.inStock else { return }
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].quantity += 1
        }
    }
    
    func decreaseQuantity(for product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id && $0.quantity > 0 }) {
            products[index].quantity -= 1
        }
    }
    
    func deleteProduct(_ product: Product) {
        products.removeAll(where: { $0.id == product.id })
    }
    
    func applyDiscount() {
        for index in 0..<products.count {
            let discountedPrice = products[index].price * (1 - discount / 100)
            products[index].price = max(0, discountedPrice)
        }
    }
}
