//
//  StepperButtonModifier.swift
//  OnlineShoppee
//
//  Created by anita on 3/19/23.
//

import SwiftUI

struct StepperButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .frame(width: 38, height: 22)
            .background(Colors.buttonColor)
            .cornerRadius(8)
            
    }
}

