//
//  MainCoordinator.swift
//  OnlineShoppee
//
//  Created by anita on 3/20/23.
//

import SwiftUI

@MainActor
class MainFlowCoordinator: ObservableObject {

    // MARK: Stored Properties
    
    @Published var tabSelection: TabBarItem = .home
    @Published var mainPageCoordinator: MainPageCoordinator!
    @Published var detailPageCoordinator: DetailPageCoordinator!
    @Published var profileCoordinator: ProfileCoordinator!
    
    init() {
        mainPageCoordinator = .init(parent: self)
        detailPageCoordinator = .init(parent: self, isTabbarHidden: false, willChangeTabTo: .home)
        profileCoordinator = .init(parent: self)
    }
    
   
}
