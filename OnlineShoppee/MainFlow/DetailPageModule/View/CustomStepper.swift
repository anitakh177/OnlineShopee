//
//  CustomStepper.swift
//  OnlineShoppee
//
//  Created by anita on 3/16/23.
//

import SwiftUI

struct CustomStepper: View {
    @EnvironmentObject var cartManager: CartManager
    @Binding var product: ItemDetailModel
  
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Text("Quantity: \(value.formatted())")
            Text("Quantity: \(cartManager.products.count)")
                .font(.custom(.semibold, size: 12))
                .foregroundColor(.gray)
            HStack(spacing: 20) {
                Button("—") {
                    
                    cartManager.removeFromCart(product: product)
                    
                } 
            .foregroundColor(.white)
            .font(.headline)
            .frame(width: 38, height: 22)
            .background(Colors.buttonColor)
            .cornerRadius(8)
            
            Button("+") {
                cartManager.addToCart(product: product)
            }
            .foregroundColor(.white)
            .font(.headline)
            .frame(width: 38, height: 22)
            .background(Colors.buttonColor)
            .cornerRadius(8)
        }
    }
            
            .buttonStyle(.plain)
        }
    }


struct MyStepper_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomStepper(product: .constant(ItemDetailModel(name: "sfaf", description: "Dsg", rating: 234, numberOfReviews: 35, price: 34545, colors: [], imageUrls: [])))
                .environmentObject(CartManager())
                .controlSize(.mini)
        }
        .padding()
    }
}
