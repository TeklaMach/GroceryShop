//
//  Product.swift
//  GroceryShop
//
//  Created by Tekla Matcharashvili on 10.12.23.
//

import Foundation

struct Product: Identifiable {
    var id: UUID = UUID()
    var name: String
    var quantity: Int
    var price: Double
    var image: String
    var inStock: Bool = true
}
