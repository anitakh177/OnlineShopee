//
//  HideKeyboard.swift
//  OnlineShoppee
//
//  Created by anita on 3/21/23.
//

import SwiftUI

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
