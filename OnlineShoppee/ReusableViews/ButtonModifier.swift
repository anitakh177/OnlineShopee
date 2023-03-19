//
//  ButtonView.swift
//  OnlineShoppee
//
//  Created by anita on 3/10/23.
//

import SwiftUI

struct ButtonModifier: ViewModifier{
  
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.custom(.medium, size: 16))
            .frame(width: 290, height: 40)
            .background(Colors.buttonColor)
            .cornerRadius(15)
    }
}

