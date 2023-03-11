//
//  ButtonView.swift
//  OnlineShoppee
//
//  Created by anita on 3/10/23.
//

import SwiftUI

struct ButtonView: View {
    let buttonText: String
    var body: some View {
       
        Text(buttonText)
        .foregroundColor(.white)
        .frame(width: 290, height: 40)
        .background(Colors.buttonColor)
        .cornerRadius(15)
    }
}
