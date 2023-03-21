//
//  Products.swift
//  OnlineShoppee
//
//  Created by anita on 3/21/23.
//

import Foundation

struct LatestProducts: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let category: String
    let image: String
}

struct SaleProducts: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let category: String
    let image: String
    let discount: String
}
