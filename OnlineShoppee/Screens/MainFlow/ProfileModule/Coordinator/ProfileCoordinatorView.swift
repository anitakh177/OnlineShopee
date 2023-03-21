//
//  ProfileCoordinatorView.swift
//  OnlineShoppee
//
//  Created by anita on 3/20/23.
//

import SwiftUI

struct ProfileCoordinatorView: View {
    
    @ObservedObject var coordinator: ProfileCoordinator
    
    var body: some View {
        NavigationView {
            ProfileView(viewModel: coordinator.viewModel!)
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(Colors.backgroundColor, for: .navigationBar)
                .toolbarBackground(.hidden, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            
                        } label: {
                            Image(NavigationIcons.arrowLeft)
                        }
                        
                    }
                }
            
        }
    }
}

