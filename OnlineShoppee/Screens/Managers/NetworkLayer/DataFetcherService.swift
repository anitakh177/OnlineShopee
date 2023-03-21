//
//  ProductFeed.swift
//  OnlineShoppee
//
//  Created by anita on 3/20/23.
//

import Foundation

enum DataFetcherService {
    case latestProducts
    case flashSaleProducts
    case productDetails
    case brandSearch
}
extension DataFetcherService: Endpoint {
    var path: String {
        switch self {
        case .latestProducts: return "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        case .flashSaleProducts: return "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
        case .productDetails: return "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239"
        case .brandSearch: return "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19"
        }
    }
}
