//
//  ListStruct.swift
//  OnlineShoppee
//
//  Created by anita on 3/10/23.
//

import SwiftUI

struct ListItem {
    let id = UUID()
    let iconImage: String
    let title: String
    let buttonImage: String
    
}

struct ListItemWithoutButton {
    let id = UUID()
    let iconImage: String
    let title: String
    let number: String
    
}

struct ListContext {
    private let tradeStore = ListItem(iconImage: "card", title: "Trade store", buttonImage: "arrow")
    private let payment = ListItem(iconImage: "card", title: "Payment method", buttonImage: "arrow")
   // private let balance = ListItemWithoutButton(iconImage: "card", title: "Balace", number: "$1593")
    private let tradeHistory = ListItem(iconImage: "card", title: "Trade history", buttonImage: "arrow")
    private let restorePurchase = ListItem(iconImage: "restore", title: "Restore Purchase", buttonImage: "arrow")
    private let help = ListItem(iconImage: "help", title: "Help", buttonImage: "")
    private let logout = ListItem(iconImage: "logout", title: "Log out", buttonImage: "")
    
    
}
