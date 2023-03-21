//
//  MainPageViewModel.swift
//  OnlineShoppee
//
//  Created by anita on 3/13/23.
//

import Foundation
import Combine

final class MainPageViewModel: ObservableObject {
    
// MARK: - Properties
    
    weak var coordinator: MainPageCoordinator?
    
    @Published var latestProducts: LatestItemModel?
    @Published var saleProducts: FlashSaleModel?
    
    private var cancellable =  Set<AnyCancellable>()
    private let productFetcher: ProductFetcherProtocol
    
// MARK: Init
    
    init(coordinator: MainPageCoordinator, productFetcher: ProductFetcher) {
        self.coordinator = coordinator
        self.productFetcher = productFetcher
       fetchItems()
    }
    
}

// MARK: Private methods

private extension MainPageViewModel {
    func fetchItems() {
        productFetcher.getFlashSaleProducts(.flashSaleProducts).zip(productFetcher.getLatestProducts(.latestProducts))
            .sink(receiveCompletion: { _ in},
                  receiveValue: { [weak self] sale, latest in
                guard let self = self else { return }
                self.saleProducts = sale
                self.latestProducts = latest
            })
            .store(in: &cancellable)

    }
}


