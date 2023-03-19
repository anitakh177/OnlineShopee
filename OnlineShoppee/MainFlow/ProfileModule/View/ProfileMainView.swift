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
                CollectionView(session: session)
                Spacer()
            }
            .background(Colors.backgroundColor)
            .padding(.bottom, 40)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Colors.backgroundColor, for: .navigationBar)
            .toolbarBackground(.hidden, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Image("arrow.left")
                    }
                    
                }
            }

            
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
                .font(.custom(.regular, size: 11))
                .foregroundColor(Colors.grayColor)
            Spacer()
                Text("Satria Adhi Pradana")
                .font(.custom(.semibold, size: 18))
            Spacer()
            Button {
                
            } label: {
                Button {
                    
                } label: {
                    Label("Upload idem", image: "upload")
                }
                .modifier(ButtonModifier())

            }
        }
        .padding(.vertical, 20)
        .frame(height: 204)
        
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
                .font(.custom(.medium, size: 16))
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
                .font(.custom(.medium, size: 16))
            Spacer()
           Text("$ 1593")
                .font(.custom(.medium, size: 16))
            
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
