//
//  MainPageViewModel.swift
//  OnlineShoppee
//
//  Created by anita on 3/13/23.
//

import Foundation
import Combine
import UIKit


final class MainPageViewModel: ObservableObject {
    
    unowned let coordinator: MainPageCoordinator
    
    @Published var latestProducts = [LatestProducts]()
    @Published var saleProducts = [SaleProducts]()
    
    private var cancellable =  Set<AnyCancellable>()
    
    private let productFetcher: ProductFetcher
    
    init(coordinator: MainPageCoordinator, productFetcher: ProductFetcher) {
        self.coordinator = coordinator
        self.productFetcher = productFetcher
       fetchItems()
    }
    

    func fetchItems() {
        productFetcher.getFlashSaleProducts(.flashSaleProducts).zip(productFetcher.getLatestProducts(.latestProducts))
            .sink(receiveCompletion: { _ in},
                  receiveValue: { [weak self] sale, latest in
                guard let self = self else { return }
                self.saleProducts = sale.flashSale.map {
                    SaleProducts(name: $0.name, price: "$\($0.price)", category: $0.category, image: $0.imageURL, discount: "\($0.discount)%")
                }
                
                self.latestProducts = latest.latest.map { LatestProducts(name: $0.name, price: "$\($0.price)", category: $0.category, image: $0.imageURL)
                    
                }
            })
            .store(in: &cancellable)
      
    }
    
    

}


