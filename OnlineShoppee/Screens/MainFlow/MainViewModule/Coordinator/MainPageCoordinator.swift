//
//  MainPageCoordinator.swift
//  OnlineShoppee
//
//  Created by anita on 3/20/23.
//

import SwiftUI

@MainActor
final class MainPageCoordinator: ObservableObject, Identifiable {
    
    // MARK: Properties
    
    private weak var parent: MainFlowCoordinator?
    @Published var viewModel: MainPageViewModel?
    @Published var detailPageCoordinator: DetailPageCoordinator?
    
    // MARK: Init
    
    init(parent: MainFlowCoordinator?) {
        self.parent = parent
        self.viewModel = MainPageViewModel(coordinator: self, productFetcher: ProductFetcher(network: NetworkService()))
    }
    
    // MARK: Internal Methods
    
    func openDetailPage() {
        detailPageCoordinator = DetailPageCoordinator(parent: parent, isTabbarHidden: false, willChangeTabTo: .home)
    }
}


