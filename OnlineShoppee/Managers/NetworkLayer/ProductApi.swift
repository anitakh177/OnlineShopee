//
//  ProductApi.swift
//  OnlineShoppee
//
//  Created by anita on 3/20/23.
//

import Foundation
import Combine

final class ProductFetcher: NetworkService {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getLatestProducts(_ feedKind: DataFetcherService) -> AnyPublisher<LatestItemModel, Error> {
        execute(feedKind.request, decodingType: LatestItemModel.self, retries: 2)
    }
    
   func  getFlashSaleProducts(_ feedKind: DataFetcherService) -> AnyPublisher<FlashSaleModel, Error> {
        execute(feedKind.request, decodingType: FlashSaleModel.self, retries: 2)
    }
    
    func productDetail(_ feedKind: DataFetcherService) -> AnyPublisher<ItemDetailModel, Error> {
        execute(feedKind.request, decodingType: ItemDetailModel.self, retries: 2)
    }
    
}
