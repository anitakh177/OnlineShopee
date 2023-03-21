//
//  DetailPageViewModel.swift
//  OnlineShoppee
//
//  Created by anita on 3/16/23.
//

import Foundation
import Combine

struct ItemDetailViewModel: Hashable {
    let name, description: String
    let rating: String
    let numberOfReviews, price: String
    let colors: [String]
    let imageUrls: [String]

}

@MainActor 

final class DetailPageViewModel: ObservableObject {
    
    private unowned let coordinator: DetailPageCoordinator
    private let willChangeTabTo: TabBarItem
    
    init(coordinator: DetailPageCoordinator, willChangeTabTo: TabBarItem) {
        self.coordinator = coordinator
        self.willChangeTabTo = willChangeTabTo
        
        fetchItems()
    }
    
    func changeTab() {
        coordinator.changeTab(with: willChangeTabTo)
    }
    
    @Published var itemViewModel: ItemDetailViewModel?
    @Published var productItem: ItemDetailModel?
    @Published var selectedImage: Int = 1
    
    private var cancellable: AnyCancellable?
    private let productFetcher = ProductFetcher()
    
    func fetchItems() {
        cancellable = productFetcher.productDetail(.productDetails)
                   .sink(receiveCompletion: { _ in },
                   receiveValue: {
                       self.productItem = $0
                       self.itemViewModel =  ItemDetailViewModel(name: $0.name, description: $0.description, rating: "\($0.rating)", numberOfReviews: "(\($0.numberOfReviews)", price: "$\($0.price)", colors: $0.colors, imageUrls: $0.imageUrls)
                
                   })
    }
}
