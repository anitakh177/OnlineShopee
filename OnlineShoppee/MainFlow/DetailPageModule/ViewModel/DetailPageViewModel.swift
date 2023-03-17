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



final class DetailPageViewModel: ObservableObject {

    @Published var itemViewModel: ItemDetailViewModel?
    @Published var productItem: ItemDetailModel?
    @Published var selectedImage: Int = 1
    private var bag : AnyCancellable?
    
    
    func fetchLatestItems() {
        guard let url = URL(string: "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239") else { return }
        
        bag = NetworkingManager.download(url: url)
                .decode(type: ItemDetailModel.self, decoder: JSONDecoder())
                .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedItems in
                    self?.itemViewModel = ItemDetailViewModel(name: returnedItems.name, description: returnedItems.description, rating: "\(returnedItems.rating)", numberOfReviews: "\(returnedItems.numberOfReviews)", price: "\(returnedItems.price)", colors: returnedItems.colors, imageUrls: returnedItems.imageUrls)
                    self?.productItem = returnedItems
                    self?.bag?.cancel()
                })
                }
    
}
