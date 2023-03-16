//
//  MainPageViewModel.swift
//  OnlineShoppee
//
//  Created by anita on 3/13/23.
//

import Foundation
import Combine

struct LatestProducts: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let category: String
    let image: String
}

struct SaleProducts: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let category: String
    let image: String
    let discount: String
}

final class MainPageViewModel: ObservableObject {
     var latesItems: LatestItemModel!
    var saleItems: FlashSaleModel!
    @Published var latestProducts = [LatestProducts]()
    @Published var saleProducts = [SaleProducts]()
    private var bag : AnyCancellable?
    
    func fetchItems() {
       
        fetchSaleItems()
        fetchLatestItems()
       
        
    
    }
    
    func fetchSaleItems() {
        guard let url = URL(string: "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac") else { return }
        
        bag = NetworkingManager.download(url: url)
            .decode(type: FlashSaleModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedItems in
                self?.saleItems = returnedItems
                print(self?.saleProducts)
                self?.mapFlashSaleItems()
                self?.bag?.cancel()
            })
    }
    
    func fetchLatestItems() {
        guard let url = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7") else { return }
        
        bag = NetworkingManager.download(url: url)
                .decode(type: LatestItemModel.self, decoder: JSONDecoder())
                .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedItems in
                    self?.latesItems = returnedItems
                    self?.mapProducts()
                    self?.bag?.cancel()
                })
                }
    func mapProducts() {
      
            latestProducts = latesItems.latest.compactMap({LatestProducts(name: $0.name, price: "\($0.price)", category: $0.category, image: $0.imageURL)})
        
    }
    
    func mapFlashSaleItems() {
        saleProducts = saleItems.flashSale.compactMap({SaleProducts(name: $0.name, price: "\($0.price)", category: $0.category, image: $0.imageURL, discount: "\($0.discount)")})
    }

    }


