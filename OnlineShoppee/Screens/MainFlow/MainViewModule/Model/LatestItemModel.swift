//
//  LatestItems.swift
//  OnlineShoppee
//
//  Created by anita on 3/13/23.
//

import Foundation

// MARK: - LatestItems
struct LatestItemModel: Decodable {
    let latest: [Latest]
}

// MARK: - Latest
struct Latest: Decodable, Identifiable {
    let id = UUID()
    let category, name: String
    let price: Int
    let imageUrl: String

}
