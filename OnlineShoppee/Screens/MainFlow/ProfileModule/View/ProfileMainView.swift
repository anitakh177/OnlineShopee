//
//  ContentView.swift
//  OnlineShoppee
//∏
//  Created by anita on 3/10/23.
//

import SwiftUI

struct ProfileView: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: ProfileViewModel
    @EnvironmentObject var session: SessionManager
    
    // MARK: - View
   
    var body: some View {
       
            VStack {
                ProfileMainView(selectedImage: $viewModel.selectedImage, isPickerShowing: $viewModel.isPickerShowing)
                CollectionView(viewModel: viewModel, session: session)
                Spacer()
            }
            .background(Colors.backgroundColor)
            .padding(.bottom, 40)
           
       .sheet(isPresented: $viewModel.isPickerShowing) {
            ImagePicker(selectedImage: $viewModel.selectedImage, isPickerShowing: $viewModel.isPickerShowing)
        }
    
    }
}

// MARK: - Profile Main View

struct ProfileMainView: View {
   
    @Binding var selectedImage: UIImage?
    @Binding var isPickerShowing: Bool
    var body: some View {
        VStack {
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .background(.gray)
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
        } else {
            Image("profileImage")
                .resizable()
                .background(.gray)
                .frame(width: 60, height: 60)
                .cornerRadius(30)
        }
            Text("Change Photo")
                .font(.custom(.regular, size: 11))
                .foregroundColor(Colors.grayColor)
            Spacer()
                Text("Satria Adhi Pradana")
                .font(.custom(.semibold, size: 18))
            Spacer()
            Button {
                isPickerShowing = true
            } label: {
                
                    Label("Upload idem", image: Buttons.upload)
                }
                .modifier(ButtonModifier())
        }
        .padding(.vertical, 20)
        .frame(height: 204)
        
    }
}

// MARK: Row View

struct RowView: View {
    let title: String
    let iconImage: String
    let isWithButton: Bool
    var body: some View {
        HStack {
            RoundView(image: iconImage)
            Text(title)
                .font(.custom(.medium, size: 16))
            Spacer()
            isWithButton ? Image(NavigationIcons.arrow) : nil
        }
        .frame(height: 50)
        .padding(.trailing, 18)
    }
}

struct BalanceRowView: View {
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
    var viewModel: ProfileViewModel
    var session: SessionManager
    var body: some View {
        VStack {
            RowView(title: "Trade store", iconImage: Icons.card, isWithButton: true)
            RowView(title: "Payment method", iconImage: Icons.card, isWithButton: true)
            BalanceRowView(title: "Balance", iconImage: Icons.card)
            RowView(title: "Trade history", iconImage: Icons.card, isWithButton: true)
            
            RowView(title: "Restore purchase", iconImage: Icons.card, isWithButton: true)
            RowView(title: "Help", iconImage: Icons.help, isWithButton: false)
            RowView(title: "Log out", iconImage: Icons.logout, isWithButton: false)
                .onTapGesture {
                    withAnimation {
                        session.LogOut()
                    }
                }
            
        }
        .padding(.horizontal, 26)
        .frame( maxWidth: .infinity)
        .edgesIgnoringSafeArea(.all)
        .listStyle(PlainListStyle())
    }
}
