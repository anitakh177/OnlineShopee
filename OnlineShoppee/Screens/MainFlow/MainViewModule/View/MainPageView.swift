//
//  MainView.swift
//  OnlineShoppee
//
//  Created by anita on 3/13/23.
//

import SwiftUI

struct MainPageView: View {
    
    // MARK: - Proprtie
    @StateObject var viewModel: MainPageViewModel
    
    // MARK: - View
    
    var body: some View {
       
            VStack(spacing: 22) {
                SearchBar(text: .constant(""))

                List() {
                    CategoryCollectionView()
                        .modifier(ListModifier())
    
                    Section {
                        LatestCollectionView(viewModel: viewModel)
                            .modifier(ListModifier())
                            
                    } header: {
                        SectionHeaderView(sectionTitle: "Latest")
                    }

                    Section {
                        FlashSaleCollectionView(viewModel: viewModel)
                            .modifier(ListModifier())
                    } header: {
                       SectionHeaderView(sectionTitle: "Flash Sale")
                    }
                    
                    Section {
                        LatestCollectionView(viewModel: viewModel)
                            .modifier(ListModifier())
                    } header: {
                        SectionHeaderView(sectionTitle: "Brands")
                    }

                    }
                
                    .listStyle(.plain)
                    
            }
            .padding(.horizontal, 11)
            .background(Colors.backgroundColor)
            .padding(.bottom, 40)
            .accentColor(.black)
            
    }
}

// MARK: - Category View

struct CategoryView: View {
    var title: String
    var image: String
    
    var body: some View {
        VStack(spacing: 10) {
            RoundView(image: image)
            Text(title)
                .font(.custom(.regular, size: 10))
                .foregroundColor(Colors.grayColor)
                .scaledToFit()
                .minimumScaleFactor(0.7)
            
        }
    }
}

struct CategoryCollectionView: View {
   
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem((.flexible()))], spacing: 20) {
                ForEach(Box.box) { item in
                    CategoryView(title: item.title, image: item.image)
                }
            }
        }
        .scrollIndicators(.hidden)
      
    }
}

// MARK: - Latest Items

struct LatestItemsView: View {
    var latest: Latest
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string:latest.imageUrl)) { image in
                  image
                    .resizable()
                    .frame(width: 114, height: 129)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(12)
            } placeholder: {
                Color.gray
            }

            HStack {
                VStack(alignment: .leading) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 7)
                            .fill(.white)
                            .opacity(0.5)
                            .frame(width: 50)
                        Text(latest.category)
                            .font(.custom(.semibold, size: 10))
                    }
                    Text(latest.name)
                        .foregroundColor(.white)
                        .font(.custom(.bold, size: 12))
                        .lineLimit(2)
                    Text("$\(latest.price)")
                        .foregroundColor(.white)
                        .font(.custom(.bold, size: 10))
                }
                .frame(height: 52)
          
                
                Button {
                    
                } label: {
                    Image(Buttons.addSmall)
                }

            }
            .padding(EdgeInsets.init(top: 91, leading: 7, bottom: 7, trailing: -5))
        }
        
    }
       
}

struct LatestCollectionView: View {
   @StateObject var viewModel: MainPageViewModel
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem((.flexible()))], spacing: 12) {
                if let latestProducts = viewModel.latestProducts {
                    ForEach(latestProducts.latest) { item in
                            LatestItemsView(latest: item)
                            .onTapGesture {
                                viewModel.coordinator?.openDetailPage()
                                
                            }
                    }
                    .frame(width: 114, height: 129)
                }
               
            }
        }
        .padding(.bottom, 40)
        .scrollIndicators(.hidden)
    }
}

// MARK: - Flash Sale View

struct SaleItemView: View {
    var saleItem: FlashSale
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: saleItem.imageUrl)) { image in
                  image
                    .resizable()
                    .frame(width: 174, height: 221)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(12)
            } placeholder: {
                Color.gray
            }
            VStack {
                HStack {
                    Image("saleAvatar")
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 9)
                            .fill(.red)
                            .frame(width: 50, height: 20)
                        Text("\(saleItem.discount)%")
                            .foregroundColor(.white)
                            .font(.custom(.bold, size: 15))
                    }
                }
                .padding(.horizontal, 7.5)
                .padding(.top, 7.5)
                Spacer()
                HStack {
                    VStack() {
                            ZStack {
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(.white)
                                    .opacity(0.5)
                                    .frame(width: 50, height: 17)
                                Text(saleItem.category)
                                    .font(.custom(.medium, size: 13))
                            }
                            Text(saleItem.name)
                                .foregroundColor(.white)
                                .font(.custom(.bold, size: 16))
                                .lineLimit(2)
                            Text("$\(saleItem.price)")
                                .foregroundColor(.white)
                                .font(.custom(.medium, size: 13))
                    }
                    .padding(.horizontal, 10)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Image(Buttons.like)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(Buttons.add)
                        }

                    }
                   
                   
                }
            }

        }
       .frame(width: 174, height: 221)
    }
}

struct FlashSaleCollectionView: View {
    @StateObject var viewModel: MainPageViewModel
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.flexible())]) {
                if let saleProducts = viewModel.saleProducts {
                    ForEach(saleProducts.flashSale) { item in
                            SaleItemView(saleItem: item)
                            .onTapGesture {
                                viewModel.coordinator?.openDetailPage()
                            }
                    }
                }
            }
        }
    }
}

// MARK: - Section Header View

struct SectionHeaderView: View {
    var sectionTitle: String
    var body: some View {
        HStack {
            Text(sectionTitle)
                .font(.custom(.semibold, size: 16))
                .foregroundColor(.black)
            Spacer()
            Button("View all") {
                
            }
            .font(.custom(.medium, size: 11))
            .foregroundColor(Colors.grayColor)
        }
    }
}
