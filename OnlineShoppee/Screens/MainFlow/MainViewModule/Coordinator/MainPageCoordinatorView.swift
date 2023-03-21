//
//  MainPageCoordinatorView.swift
//  OnlineShoppee
//
//  Created by anita on 3/20/23.
//

import SwiftUI

struct MainPageCoordinatorView: View {
    @ObservedObject var coordinator: MainPageCoordinator
    var body: some View {
        NavigationView {
            
            if let viewModel = coordinator.viewModel {
                MainPageView(viewModel: viewModel)
                    .navigationTitle("Trade by bata")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                
                            } label: {
                                Image(NavigationIcons.menu)
                            }
                            
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            VStack(spacing: 0) {
                                Image("avatar")
                                Button {
                                } label: {
                                    HStack(spacing: 4){
                                        Text("Location")
                                            .font(.custom(.light, size: 8))
                                            .foregroundColor(.black)
                                        Image(NavigationIcons.arrowDown)
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                    .navigation(item: $coordinator.detailPageCoordinator) { coordinator in
                       DetailPageCoordinatorView(coordinator: coordinator)
                }
            }
        }
    }
}

