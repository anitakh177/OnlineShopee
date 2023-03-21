//
//  LatestItems.swift
//  OnlineShoppee
//
//  Created by anita on 3/13/23.
//

import Foundation

// MARK: - LatestItems
struct LatestItemModel: Codable {
    let latest: [Latest]
}

// MARK: - Latest
struct Latest: Codable {
    let category, name: String
    let price: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }
}
