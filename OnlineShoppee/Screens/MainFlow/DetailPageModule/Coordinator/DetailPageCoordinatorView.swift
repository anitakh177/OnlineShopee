//
//  DetailPageCoordinatorView.swift
//  OnlineShoppee
//
//  Created by anita on 3/20/23.
//

import SwiftUI

struct DetailPageCoordinatorView: View {
    @ObservedObject var coordinator: DetailPageCoordinator
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var backButton : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: NavigationIcons.chevronLeft)
                        .renderingMode(.template)
                        .foregroundColor(.black)
                        
                }
            }
        }
    
    var body: some View {
        if let viewModel = coordinator.viewModel {
            DetailPageView(viewModel: viewModel)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: backButton)
        }
    }
}


struct DetailPageCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPageCoordinatorView(coordinator: DetailPageCoordinator(parent: MainFlowCoordinator(), isTabbarHidden: false, willChangeTabTo: .home))
    }
}

