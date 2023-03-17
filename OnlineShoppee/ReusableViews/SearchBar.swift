//
//  SearchBar.swift
//  OnlineShoppee
//
//  Created by anita on 3/14/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField("What are you looking for?", text: $text)
                .foregroundColor(.black)
                .font(.custom(.regular, size: 10))
                .padding(8)
                .multilineTextAlignment(.center)
                .background(Colors.searchBarColor)
                .cornerRadius(20)
                .overlay(
                    HStack {
                        Image("search")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
               
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
        .padding(.horizontal, 55)
       // .frame(width: 262, height: 24)
    }
}
struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
