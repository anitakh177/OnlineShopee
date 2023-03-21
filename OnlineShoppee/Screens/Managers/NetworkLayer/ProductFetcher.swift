//
//  ProductApi.swift
//  OnlineShoppee
//
//  Created by anita on 3/20/23.
//

import Foundation
import Combine

protocol ProductFetcherProtocol: AnyObject {
    var network: NetworkServiceProtocol { get }
    func getLatestProducts(_ feedKind: DataFetcherService) -> AnyPublisher<LatestItemModel, Error>
    func getFlashSaleProducts(_ feedKind: DataFetcherService) -> AnyPublisher<FlashSaleModel, Error>
    func productDetail(_ feedKind: DataFetcherService) -> AnyPublisher<ItemDetailModel, Error>
}

final class ProductFetcher: ProductFetcherProtocol {
    var network: NetworkServiceProtocol
    
    init(network: NetworkServiceProtocol) {
        self.network = network
    }
    
    func getLatestProducts(_ feedKind: DataFetcherService) -> AnyPublisher<LatestItemModel, Error> {
        network.execute(feedKind.request, decodingType: LatestItemModel.self, retries: 2)
    }
    
   func  getFlashSaleProducts(_ feedKind: DataFetcherService) -> AnyPublisher<FlashSaleModel, Error> {
       network.execute(feedKind.request, decodingType: FlashSaleModel.self, retries: 2)
    }
    
    func productDetail(_ feedKind: DataFetcherService) -> AnyPublisher<ItemDetailModel, Error> {
        network.execute(feedKind.request, decodingType: ItemDetailModel.self, retries: 2)
    }
    
    
}
