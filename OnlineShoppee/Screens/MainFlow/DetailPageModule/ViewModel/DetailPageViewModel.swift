//
//  DetailPageViewModel.swift
//  OnlineShoppee
//
//  Created by anita on 3/16/23.
//

import Foundation
import Combine

@MainActor
final class DetailPageViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var productItem: ItemDetailModel?
    @Published var selectedImage: Int = 1
    
    private var cancellable: AnyCancellable?
    private let productFetcher: ProductFetcherProtocol
    
    private weak var coordinator: DetailPageCoordinator?
    private let willChangeTabTo: TabBarItem
    
    // MARK: Init
    
    init(coordinator: DetailPageCoordinator, willChangeTabTo: TabBarItem, productFetcher: ProductFetcherProtocol) {
        self.coordinator = coordinator
        self.willChangeTabTo = willChangeTabTo
        self.productFetcher = productFetcher
        
        fetchItems()
    }
    // MARK: Internal Methods
    
    func changeTab() {
        coordinator?.changeTab(with: willChangeTabTo)
    }
    
}
// MARK: Private Methods

private extension DetailPageViewModel {
    func fetchItems() {
        cancellable = productFetcher.productDetail(.productDetails)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] item in
                guard let self = self else { return }
                self.productItem = item
                
                
            })
    }
}

