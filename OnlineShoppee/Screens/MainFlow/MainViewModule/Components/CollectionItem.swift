//
//  CollectionItem.swift
//  OnlineShoppee
//
//  Created by anita on 3/20/23.
//

import Foundation

struct Box: Identifiable {
    var id = UUID()
    var title:  String
    var image: String
    
    static let box: [Box] = [
        Box(title: "Phones", image: CollectionIcons.phone),
        Box(title: "Headphones", image: CollectionIcons.phone),
        Box(title: "Games", image: CollectionIcons.game),
        Box(title: "Cars", image: CollectionIcons.car),
        Box(title: "Furniture", image: CollectionIcons.furniture),
        Box(title: "Kids", image: CollectionIcons.kids),
    ]
    
    
}

