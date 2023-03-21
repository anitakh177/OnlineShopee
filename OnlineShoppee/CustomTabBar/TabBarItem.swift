//
//  TabBarItem.swift
//  OnlineShoppee
//
//  Created by anita on 3/15/23.
//

import Foundation

enum TabBarItem: Hashable {
    case home
    case favorites
    case cart
    case chat
    case profile
    
    var iconName: String {
        switch self {
        case .home:
            return "home"
        case .favorites:
            return "favorite"
        case .cart:
            return "cart"
        case .chat:
            return "chat"
        case .profile:
            return "profile"
        }
    }
}
