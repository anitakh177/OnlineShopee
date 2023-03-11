//
//  ContentView.swift
//  OnlineShoppee
//∏
//  Created by anita on 3/10/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var session: SessionManager
    
    var body: some View {
        NavigationView {
            VStack {
                ProfileMainView()
                    .frame(height: 204)
                CollectionView(session: session)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(SessionManager())
    }
}

struct ProfileMainView: View {
    var body: some View {
        VStack {
            Image("profileImage")
                .resizable()
                .background(.gray)
                .frame(width: 60, height: 60)
                .cornerRadius(30)
            Text("Change Photo")
                .font(.custom("Montserrat-VariableFont_wght", size: 10))
                .foregroundColor(Colors.grayColor)
            Spacer()
                Text("Satria Adhi Pradana")
                .font(.custom("Montserrat-VariableFont_wght", size: 23))
            Spacer()
                ButtonView(buttonText: "Upload item")
            
            
          
        }
        
    }
}



struct RoundView: View {
    let image: String
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .frame(width: 22, height: 16)
        }
        .frame(width: 40, height: 40)
        .background(Colors.lightGrayColor)
        .clipShape(Circle())
        
        
    }
}

struct CellWithButton: View {
    let title: String
    let iconImage: String
    let isWithButton: Bool
    var body: some View {
        HStack {
            RoundView(image: iconImage)
            Text(title)
                .font(.title3)
            Spacer()
            isWithButton ? Image("arrow") : nil
            
            
        }
        .frame(height: 50)
        .padding(.trailing, 18)
    }
}

struct BalanceCell: View {
    let title: String
    let iconImage: String
   
    var body: some View {
        HStack {
            RoundView(image: iconImage)
            Text(title)
                .font(.title3)
            Spacer()
           Text("$ 1593")
            
        }
        .frame(height: 50)
        .padding(.trailing, 18)
    }
}

struct CollectionView: View {
    var session: SessionManager
    var body: some View {
        VStack {
            CellWithButton(title: "Trade store", iconImage: "card", isWithButton: true)
            CellWithButton(title: "Payment method", iconImage: "card", isWithButton: true)
            BalanceCell(title: "Balance", iconImage: "card")
            CellWithButton(title: "Trade history", iconImage: "card", isWithButton: true)
            
            CellWithButton(title: "Restore purchase", iconImage: "card", isWithButton: true)
            CellWithButton(title: "Help", iconImage: "help", isWithButton: false)
            CellWithButton(title: "Log out", iconImage: "logout", isWithButton: false)
                .onTapGesture {
                    withAnimation {
                        session.LogOut()
                    }
                }
            
        }.padding(.horizontal, 26)
        
            .frame( maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)
            .listStyle(PlainListStyle())
    }
}
