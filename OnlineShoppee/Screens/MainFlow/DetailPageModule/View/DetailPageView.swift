//
//  DetailPageView.swift
//  OnlineShoppee
//
//  Created by anita on 3/17/23.
//

import SwiftUI

struct DetailPageView: View {
    // MARK: - Propepties
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel: DetailPageViewModel
    @StateObject var cartManager = CartManager()
    
    
    var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: NavigationIcons.chevronLeft)
                        .renderingMode(.template)
                        .foregroundColor(.black)
                        
                }
            }
        }
    
    // MARK: - View

    var body: some View {
        VStack() {
            ScrollView(.vertical) {
            if let product = viewModel.itemViewModel {
                MainImageView(imageUrl: product.imageUrls[viewModel.selectedImage])
                ImageCollectionView(selectedImage: $viewModel.selectedImage, imageUrl: product.imageUrls)
                ProductInfoView(item: product)
            }
        }
       
          
            if let product = viewModel.productItem {
                DetailFooterView(product: product)
                    .environmentObject(cartManager)
                    
                    .padding(.bottom, -15)
                    
            }
        }
        .padding(.bottom, 40)
      
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
    
}

// MARK: ImageCollectionView

struct ImageCollectionView: View {
    @Binding var selectedImage: Int
    var imageUrl: [String]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.flexible())]) {
                ForEach(Array(imageUrl.enumerated()), id: \.offset) { index, image in
                    AsyncImage(url: URL(string: image)) { item in
                        item
                            .resizable()
                            .frame(width: 66, height: 38)
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(12)
                        
                    } placeholder: {
                        Color.gray
                    }
                    .onTapGesture {
                        selectedImage = index
                       
                    }
                }
                
            }
        }
        .frame(height: 45)
        .padding(.horizontal, 70)
        .padding(.bottom, 28)
    }
}

struct MainImageView: View {
    var imageUrl: String
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .frame(width: 328, height: 279)
                    .cornerRadius(12)
                    .padding(EdgeInsets(top: 0, leading: -5, bottom: 0, trailing: 45))
                
                
                
            } placeholder: {
                Color.gray
            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Colors.lightBlueColor)
                
                VStack(spacing: 14) {
                    Button {
                        
                    } label: {
                        Image(Icons.heart)
                            .renderingMode(.template)
                            .tint(Colors.violetColor)
                            .frame(width: 15, height: 13)
                    }
                    Image(Icons.divider)
                    Button {
                        
                    } label: {
                        Image(Buttons.share)
                    }
                }
            }
            .frame(width: 42, height: 95)
            .padding(EdgeInsets(top: 151, leading: 275, bottom: 0, trailing: 11))
            
        }
        .padding(.bottom, 20)
    }
}
// MARK: - ColorView

struct ColorSelectionView: View {
    var colors: [String]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Color")
                .font(.custom(.medium, size: 15))
                .foregroundColor(Colors.grayColor)
            HStack {
                LazyHGrid(rows: [GridItem(.flexible())]) {
                    ForEach(colors, id: \.self) { color in
                        
                        Button("", action: {
                            
                        })
                        
                        .frame(width: 32, height: 24)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                        .background(Color(hex: color))
                        .cornerRadius(10)
                    }
                }
            }
        }
    }
}

// MARK: - ProductInfoView

struct ProductInfoView: View {
    var item: ProductDetail
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text(item.name)
                    .font(.custom(.bold, size: 20))
                Spacer()
                Text(item.price)
                    .font(.custom(.bold, size: 17))
            }
            Text(item.description)
                .font(.custom(.regular, size: 14))
                .foregroundColor(Colors.grayColor)
                
            HStack {
                Image(Icons.star)
                    .resizable()
                    .frame(width: 15, height: 15)
                Text(item.rating)
                    .font(.custom(.medium, size: 13))
                Text(item.numberOfReviews)
                    .font(.custom(.regular, size: 13))
                    .foregroundColor(Colors.grayColor)
            }
            ColorSelectionView(colors: item.colors)
            
            
        }
        .padding(.horizontal, 23)
    }
}
