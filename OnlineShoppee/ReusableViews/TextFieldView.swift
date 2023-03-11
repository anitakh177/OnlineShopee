//
//  TextFieldView.swift
//  OnlineShoppee
//
//  Created by anita on 3/10/23.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var textProp: String
    var title: String
    var body: some View {
        TextField(title, text: $textProp)
            .foregroundColor(Colors.textFieldTextColor)
            .multilineTextAlignment(.center)
            .frame(width: 289, height: 29)
            .background(Colors.textFieldColor)
            .cornerRadius(15)
           
        
    }
}
