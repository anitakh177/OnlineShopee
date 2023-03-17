//
//  ButtonView.swift
//  OnlineShoppee
//
//  Created by anita on 3/10/23.
//

import SwiftUI

struct ButtonView: View {
    let buttonText: String
    let imageIcon: Bool
    
    var body: some View {
       
        HStack(spacing: 35) {
            imageIcon ?  Image("upload") : nil
            Text(buttonText)
                .foregroundColor(.white)
                .font(.custom(.medium, size: 16))
            
                .frame(width: 290, height: 40)
            .background(Colors.buttonColor)
        .cornerRadius(15)
        }
    }
}

