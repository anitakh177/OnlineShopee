//
//  ItemDetailModel.swift
//  OnlineShoppee
//
//  Created by anita on 3/16/23.
//

import Foundation

// MARK: - ItemDetailModel
struct ItemDetailModel: Decodable, Identifiable {
    let id = UUID()
    let name, description: String
    let rating: Double
    let numberOfReviews, price: Int
    let colors: [String]
    let imageUrls: [String]
}
