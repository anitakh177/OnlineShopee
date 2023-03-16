//
//  MainView.swift
//  OnlineShoppee
//
//  Created by anita on 3/13/23.
//

import SwiftUI

struct Box: Identifiable {
   
    var id = UUID()
    var title:  String
    var image: String
}



struct MainView: View {
    @StateObject private var viewModel = MainPageViewModel()
    
    let box: [Box] = [
    Box(title: "Phones", image: "phone"),
    Box(title: "Headphones", image: "headphone"),
    Box(title: "Games", image: "game"),
    Box(title: "Cars", image: "car"),
    Box(title: "Furniture", image: "furniture"),
    Box(title: "Kids", image: "kids"),
    ]
    
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 22) {
                SearchBar(text: .constant(""))

                List() {
                        CategoryCollectionView(box: box)
                        .listRowBackground(Colors.backgroundColor)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        .background(Colors.backgroundColor)
                    Section {
                        LatestCollectionView(latestProducts: viewModel.latestProducts)
                            .listRowBackground(Colors.backgroundColor)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                            
                    } header: {
                        HStack {
                            Text("Latest")
                            Spacer()
                            Button("View all") {
                                
                            }
                            .foregroundColor(.gray)
                        }
                    }

                    Section {
                        FlashSaleCollectionView(saleProducts: viewModel.saleProducts)
                            .listRowBackground(Colors.backgroundColor)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                    } header: {
                        HStack {
                            Text("Flash Sale")
                            Spacer()
                            Button("View all") {
                                
                            }
                            .foregroundColor(.gray)
                        }
                    }
                    
                    Section {
                        LatestCollectionView(latestProducts: viewModel.latestProducts)
                            .listRowBackground(Colors.backgroundColor)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                    } header: {
                        HStack {
                            Text("Brands")
                            Spacer()
                            Button("View all") {
                                
                            }
                            .foregroundColor(.gray)
                        }
                    }

                    }
                
                    .listStyle(.plain)
                    
                    
            
                .onAppear(perform: viewModel.fetchItems)
                .navigationTitle("Trade by bata")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            
                        } label: {
                            Image("menu")
                        }

                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        VStack(spacing: 0) {
                            Image("avatar")
                            Button {
                                
                            } label: {
                               
                                   
                                    HStack(spacing: 4){
                                        Text("Location")
                                            .font(.system(size: 8))
                                            .foregroundColor(.gray)
                                        Image("arrow.down")
                                    }
                                
                        }
                        }

                    }
            }
            }
            
            .padding(.bottom, 40)
            .padding(.horizontal, 11)
            .background(Colors.backgroundColor)
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct CategoryView: View {
    var title: String
    var image: String
    
    var body: some View {
        VStack(spacing: 10) {
            RoundView(image: image)
            Text(title)
                .font(.system(size: 10))
                .scaledToFit()
                .minimumScaleFactor(0.7)
            
        }
    }
}

struct CategoryCollectionView: View {
    var box: [Box]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem((.flexible()))], spacing: 20) {
                ForEach(box) { item in
                    CategoryView(title: item.title, image: item.image)
                }
            }
        }
        .scrollIndicators(.hidden)
      
    }
}

struct LatestItemsView: View {
    var latest: LatestProducts
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string:latest.image)) { image in
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
                            .font(.system(size: 10, weight: .medium))
                    }
                    Text(latest.name)
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .medium))
                        .lineLimit(2)
                    Text("$"+latest.price)
                        .foregroundColor(.white)
                        .font(.system(size: 10, weight: .medium))
                    
                    
                }
                .frame(height: 52)
            //.padding(EdgeInsets.init(top: 91, leading: 7, bottom: 7, trailing: -5))
                
                Button {
                    
                } label: {
                    Image("addSmall")
                }

            }
            .padding(EdgeInsets.init(top: 91, leading: 7, bottom: 7, trailing: -5))
        }
        
    }
       
}

struct LatestCollectionView: View {
    var latestProducts: [LatestProducts]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem((.flexible()))], spacing: 12) {
                ForEach(latestProducts) { item in
                    LatestItemsView(latest: item)
                }
                .frame(width: 114, height: 129)
            }
        }
        .scrollIndicators(.hidden)
    }
}

struct SaleItemView: View {
    var saleItem: SaleProducts
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: saleItem.image)) { image in
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
                        Text(saleItem.discount+"%")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold))
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
                                    .font(.system(size: 13, weight: .medium))
                            }
                            Text(saleItem.name)
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .bold))
                                .lineLimit(2)
                            Text("$"+saleItem.price)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        
                    }
                    .padding(.horizontal, 10)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Image("like")
                        }
                        
                        Button {
                            
                        } label: {
                            Image("add")
                        }

                    }
                   
                   
                }
            }

        }
       .frame(width: 174, height: 221)
    }
}

struct FlashSaleCollectionView: View {
    var saleProducts: [SaleProducts]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.flexible())]) {
                ForEach(saleProducts) { item in
                    SaleItemView(saleItem: item)
                    
                }
            }
        }
    }
}
