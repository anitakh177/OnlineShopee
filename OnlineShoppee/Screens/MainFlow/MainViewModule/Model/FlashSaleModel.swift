//
//  FlashSaleModel.swift
//  OnlineShoppee
//
//  Created by anita on 3/13/23.
//

import Foundation

// MARK: - FlashSaleModel
struct FlashSaleModel: Decodable {
    let flashSale: [FlashSale]

}

// MARK: - FlashSale
struct FlashSale: Decodable, Identifiable {
    let id = UUID()
    let category, name: String
    let price: Double
    let discount: Int
    let imageUrl: String

}
