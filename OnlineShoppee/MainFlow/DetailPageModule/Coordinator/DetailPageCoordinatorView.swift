//
//  DetailPageCoordinatorView.swift
//  OnlineShoppee
//
//  Created by anita on 3/20/23.
//

import SwiftUI

struct DetailPageCoordinatorView: View {
    @ObservedObject var coordinator: DetailPageCoordinator
    var body: some View {
        DetailPageView(viewModel: coordinator.viewModel)
    }
}


struct DetailPageCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPageCoordinatorView(coordinator: DetailPageCoordinator(parent: MainFlowCoordinator(), isTabbarHidden: false, willChangeTabTo: .home))
    }
}

