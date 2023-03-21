//
//  AppTabBarView.swift
//  OnlineShoppee
//
//  Created by anita on 3/15/23.
//

import SwiftUI

struct MainFlowCoordinatorView: View {
    @ObservedObject var coordinator: MainFlowCoordinator
    
    var body: some View {
        CustomTabBarContainerView(selection: $coordinator.tabSelection) {
        
            MainPageCoordinatorView(coordinator: coordinator.mainPageCoordinator)
                .tabBarItem(tab: .home, selection: $coordinator.tabSelection)
            Color.red
                .tabBarItem(tab:  .favorites, selection: $coordinator.tabSelection)
            Color.blue
                .tabBarItem(tab: .cart, selection: $coordinator.tabSelection)
            Color.green
                .tabBarItem(tab: .chat, selection: $coordinator.tabSelection)
            ProfileCoordinatorView(coordinator: coordinator.profileCoordinator)
                .tabBarItem(tab: .profile, selection: $coordinator.tabSelection)
            
            
        }
       
    }
}

struct AppTabBarView_Previews: PreviewProvider {
     
    static var previews: some View {
        MainFlowCoordinatorView(coordinator: MainFlowCoordinator())
    }
}
