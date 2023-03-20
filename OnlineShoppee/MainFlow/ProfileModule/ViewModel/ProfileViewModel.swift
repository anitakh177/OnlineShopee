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
}
