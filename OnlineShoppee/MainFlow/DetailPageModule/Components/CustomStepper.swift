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
            Text("Quantity: \(cartManager.products.count)")
                .font(.custom(.semibold, size: 12))
                .foregroundColor(.gray)
            HStack(spacing: 20) {
                Button("—") {
                    cartManager.removeFromCart(product: product)
                }
                .modifier(StepperButtonModifier())
          
            Button("+") {
                cartManager.addToCart(product: product)
            }
            .modifier(StepperButtonModifier())
        }
    }
            
        }
    }

