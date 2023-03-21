//
//  CartManager.swift
//  OnlineShoppee
//
//  Created by anita on 3/17/23.
//

import Foundation

class CartManager: ObservableObject {
    @Published var products: [ItemDetailModel] = []
    @Published var total: Int = 0
    
    func addToCart(product: ItemDetailModel) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: ItemDetailModel) {
        products = products.filter { $0.name != product.name }
        if total != 0 {
            total -= product.price
        }
    }
    
    
}
