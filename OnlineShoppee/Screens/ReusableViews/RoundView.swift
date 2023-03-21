//
//  RounView.swift
//  OnlineShoppee
//
//  Created by anita on 3/13/23.
//

import SwiftUI

struct RoundView: View {
    let image: String
    var body: some View {
        ZStack {
            Image(image)
        }
        .frame(width: 40, height: 40)
        .background(Colors.lightGrayColor)
        .clipShape(Circle())
        
        
    }
}
