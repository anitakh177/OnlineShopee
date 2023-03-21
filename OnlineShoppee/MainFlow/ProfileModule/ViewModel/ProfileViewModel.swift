//
//  ProfileViewModel.swift
//  OnlineShoppee
//
//  Created by anita on 3/19/23.
//

import UIKit

final class ProfileViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var isPickerShowing = false
    unowned let coordinator: ProfileCoordinator
    
    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
    }
}
