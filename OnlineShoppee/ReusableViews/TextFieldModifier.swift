//
//  TextFieldModifier.swift
//  OnlineShoppee
//
//  Created by anita on 3/19/23.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .disableAutocorrection(true)
            .foregroundColor(Colors.textFieldTextColor)
            .multilineTextAlignment(.center)
            .frame(width: 289, height: 29)
            .background(Colors.textFieldColor)
            .cornerRadius(15)
    }
}

