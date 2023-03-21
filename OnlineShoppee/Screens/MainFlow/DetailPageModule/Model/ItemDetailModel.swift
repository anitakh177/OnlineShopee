//
//  ItemDetailModel.swift
//  OnlineShoppee
//
//  Created by anita on 3/16/23.
//

import Foundation

// MARK: - ItemDetailModel
struct ItemDetailModel: Codable {
    let name, description: String
    let rating: Double
    let numberOfReviews, price: Int
    let colors: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case name, description, rating
        case numberOfReviews = "number_of_reviews"
        case price, colors
        case imageUrls = "image_urls"
    }
}
