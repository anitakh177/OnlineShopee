//
//  ProductDetail.swift
//  OnlineShoppee
//
//  Created by anita on 3/21/23.
//

import Foundation

struct ProductDetail: Hashable {
    let name, description: String
    let rating: String
    let numberOfReviews, price: String
    let colors: [String]
    let imageUrls: [String]

}
