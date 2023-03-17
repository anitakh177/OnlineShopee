//
//  DetailFooterView.swift
//  OnlineShoppee
//
//  Created by anita on 3/16/23.
//

import SwiftUI

struct DetailFooterView: View {
    @EnvironmentObject var cartManager: CartManager
   @State var product: ItemDetailModel
    //@State var count: Int = 0
    var body: some View {
       
        VStack {
            HStack(spacing: 60) {
                    CustomStepper(product: $product)
                    Button {
                    } label: {
                        HStack(spacing: 30) {
                            Text("$\(cartManager.total)")
                            Text("ADD TO CART")
                        }
                        .font(.custom(.semibold, size: 10))
                        .foregroundColor(.white)
                    }
                   
                    .frame(width: 170, height: 44)
                    .background(Colors.buttonColor)
                    .cornerRadius(15)

                }
          
            .padding(EdgeInsets(top: 22, leading: 23, bottom: 54, trailing: 23))
                
        }
        .frame(width: UIScreen.main.bounds.width, height: 117)
        .background(Colors.darkPurpleColor)
        .cornerRadius(25)
    }
}

struct DetailFooterView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFooterView(product: ItemDetailModel(name: "sfaf", description: "Dsg", rating: 234, numberOfReviews: 35, price: 315, colors: [], imageUrls: []))
            .environmentObject(CartManager())
    }
}
