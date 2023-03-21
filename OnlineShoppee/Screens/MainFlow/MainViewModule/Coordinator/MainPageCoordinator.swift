//
//  MainPageCoordinator.swift
//  OnlineShoppee
//
//  Created by anita on 3/20/23.
//

import SwiftUI

@MainActor
final class MainPageCoordinator: ObservableObject, Identifiable {
    
    private unowned let parent: MainFlowCoordinator?
    @Published var viewModel: MainPageViewModel!
    @Published var detailPageCoordinator: DetailPageCoordinator?
    
    init(parent: MainFlowCoordinator?) {
        self.parent = parent
        self.viewModel = MainPageViewModel(coordinator: self, productFetcher: ProductFetcher())
    }
    
    func openDetailPage() {
        detailPageCoordinator = DetailPageCoordinator(parent: parent, isTabbarHidden: false, willChangeTabTo: .home)
    }
}


