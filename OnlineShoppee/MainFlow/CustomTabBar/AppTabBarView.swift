//
//  AppTabBarView.swift
//  OnlineShoppee
//
//  Created by anita on 3/15/23.
//

import SwiftUI

struct AppTabBarView: View {
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            MainView()
            .tabBarItem(tab: .home, selection: $tabSelection)
            Color.red
                .tabBarItem(tab:  .favorites, selection: $tabSelection)
            Color.blue
                .tabBarItem(tab: .cart, selection: $tabSelection)
            Color.green
                .tabBarItem(tab: .chat, selection: $tabSelection)
            ProfileView()
                .tabBarItem(tab: .profile, selection: $tabSelection)
            
            
        }
       
    }
}

struct AppTabBarView_Previews: PreviewProvider {
     
    static var previews: some View {
        AppTabBarView()
    }
}
