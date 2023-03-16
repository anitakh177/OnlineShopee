//
//  OnlineShoppeeApp.swift
//  OnlineShoppee
//
//  Created by anita on 3/10/23.
//

import SwiftUI

@main
struct OnlineShoppeeApp: App {
    
    @StateObject private var session = SessionManager()
    
    var body: some Scene {
        WindowGroup {
           MainAppView()
                .environmentObject(session)
           
        }
    }
}
