//
//  ProfileCoordinator.swift
//  OnlineShoppee
//
//  Created by anita on 3/20/23.
//

import SwiftUI
import UIKit

@MainActor
final class ProfileCoordinator: ObservableObject, Identifiable {
    
    private unowned let parent: MainFlowCoordinator?
    @Published var viewModel: ProfileViewModel!
    
    init(parent: MainFlowCoordinator?) {
        self.parent = parent
        self.viewModel = ProfileViewModel(coordinator: self)
    }
    
}


