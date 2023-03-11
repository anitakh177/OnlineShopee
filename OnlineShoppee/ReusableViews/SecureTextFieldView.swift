//
//  SecureTextFieldView.swift
//  OnlineShoppee
//
//  Created by anita on 3/11/23.
//

import SwiftUI

struct SecureTextFieldView: View {
    
    @Binding var textProp: String
    var title: String
    
    var body: some View {
        SecureField(title, text: $textProp)
            .foregroundColor(Colors.textFieldTextColor)
            .multilineTextAlignment(.center)
            .frame(width: 289, height: 29)
            .background(Colors.textFieldColor)
            .cornerRadius(15)
           
    }
}

