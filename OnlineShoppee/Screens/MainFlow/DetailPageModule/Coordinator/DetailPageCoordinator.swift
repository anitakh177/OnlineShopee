//
//  DetailPageCoordinator.swift
//  OnlineShoppee
//
//  Created by anita on 3/20/23.
//

import SwiftUI

@MainActor
final class DetailPageCoordinator: ObservableObject, Identifiable {
    
    var isTabbarHidden: Bool
    @Published var viewModel: DetailPageViewModel?
    
    
    private unowned let parent: MainFlowCoordinator?
    
    init(parent: MainFlowCoordinator?, isTabbarHidden: Bool, willChangeTabTo: TabBarItem) {
        self.parent = parent
        self.isTabbarHidden = isTabbarHidden
        self.viewModel = DetailPageViewModel(coordinator: self, willChangeTabTo: willChangeTabTo, productFetcher: ProductFetcher(network: NetworkService()))
    }
    
    func changeTab(with tab: TabBarItem) {
        parent?.tabSelection = tab
    }
}


