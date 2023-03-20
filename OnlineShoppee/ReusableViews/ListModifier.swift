//
//  ListModifier.swift
//  OnlineShoppee
//
//  Created by anita on 3/19/23.
//

import SwiftUI

struct ListModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowBackground(Colors.backgroundColor)
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
    }
}

