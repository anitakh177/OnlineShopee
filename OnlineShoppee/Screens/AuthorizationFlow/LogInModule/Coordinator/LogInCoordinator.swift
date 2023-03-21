//
//  LogInCoordinator.swift
//  OnlineShoppee
//
//  Created by anita on 3/21/23.
//

import SwiftUI

@MainActor
final class LogInCoordinator: ObservableObject, Identifiable {
    
    private unowned let parent: AuthorizationFlowCoordinator?
    @Published var viewModel: LogInViewModel!
   
    
    init(parent: AuthorizationFlowCoordinator?) {
        self.parent = parent
        self.viewModel = LogInViewModel(coordinator: self, manager: RegistrationManager())
    }
 //   func openDetailPage() {
  //      detailPageCoordinator = DetailPageCoordinator(parent: parent, isTabbarHidden: false, willChangeTabTo: .home)
  //  }
}
