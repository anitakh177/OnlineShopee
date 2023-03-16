//
//  CustomTabBarView.swift
//  OnlineShoppee
//
//  Created by anita on 3/15/23.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    var body: some View {
        HStack(spacing: 30) {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(.horizontal, 30)
        .frame(maxWidth: .infinity, maxHeight: 63)
        .background(Color.white.ignoresSafeArea())
        .cornerRadius(23)
        
    }
       
    
}

struct CustomTabBarView_Previews: PreviewProvider {
    static let tabs: [ TabBarItem] = [
        .home, .favorites, .cart, .chat, .profile
    ]
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!))
        }
    }
}

extension CustomTabBarView {
    
    private func tabView(tab: TabBarItem) -> some View {
        ZStack {
            Circle()
                .fill(selection == tab ? Colors.lightGrayColor : .clear)
                .frame(width: 40, height: 40)
            
            Image(tab.iconName)
                .renderingMode(.template)
                .foregroundColor(selection == tab ? Colors.selectedTabBarTint : Colors.defaultTabBarTint)
        }
    }
        
        private func switchToTab(tab: TabBarItem) {
            withAnimation(.easeInOut) {
                selection = tab
            }
        }
    
}

