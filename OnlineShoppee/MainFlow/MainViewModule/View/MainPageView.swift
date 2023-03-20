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



struct MainPageView: View {
    @StateObject private var viewModel = MainPageViewModel()
    
    let box: [Box] = [
        Box(title: "Phones", image: CollectionIcons.phone),
        Box(title: "Headphones", image: CollectionIcons.phone),
        Box(title: "Games", image: CollectionIcons.game),
        Box(title: "Cars", image: CollectionIcons.car),
        Box(title: "Furniture", image: CollectionIcons.furniture),
        Box(title: "Kids", image: CollectionIcons.kids),
    ]
    
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 22) {
                SearchBar(text: .constant(""))

                List() {
                        CategoryCollectionView(box: box)
                        .modifier(ListModifier())
    
                    Section {
                        LatestCollectionView(latestProducts: viewModel.latestProducts)
                            .modifier(ListModifier())
                            
                    } header: {
                        SectionHeaderView(sectionTitle: "Latest")
                    }

                    Section {
                        FlashSaleCollectionView(saleProducts: viewModel.saleProducts)
                            .modifier(ListModifier())
                    } header: {
                       SectionHeaderView(sectionTitle: "Flash Sale")
                    }
                    
                    Section {
                        LatestCollectionView(latestProducts: viewModel.latestProducts)
                            .modifier(ListModifier())
                    } header: {
                        SectionHeaderView(sectionTitle: "Brands")
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
                            Image(NavigationIcons.menu)
                        }

                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        VStack(spacing: 0) {
                            Image("avatar")
                            Button {
                                
                            } label: {
                               
                                   
                                    HStack(spacing: 4){
                                        Text("Location")
                                            .font(.custom(.light, size: 8))
                                            .foregroundColor(.black)
                                        Image(NavigationIcons.arrowDown)
                                    }
                                
                        }
                        }

                    }
            }
            }
            .padding(.horizontal, 11)
            .background(Colors.backgroundColor)
            .padding(.bottom, 40)
            .accentColor(.black)
            
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}

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
                            .font(.custom(.semibold, size: 10))
                    }
                    Text(latest.name)
                        .foregroundColor(.white)
                        .font(.custom(.bold, size: 12))
                        .lineLimit(2)
                    Text(latest.price)
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
    var latestProducts: [LatestProducts]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem((.flexible()))], spacing: 12) {
                ForEach(latestProducts) { item in
                    NavigationLink(destination: DetailPageView()) {
                        LatestItemsView(latest: item)
                    }
                            
                        
                }
                .frame(width: 114, height: 129)
            }
        }
        .padding(.bottom, 40)
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
                        Text(saleItem.discount)
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
                            Text(saleItem.price)
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
    var saleProducts: [SaleProducts]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.flexible())]) {
                ForEach(saleProducts) { item in
                    NavigationLink(destination: DetailPageView()) {
                        SaleItemView(saleItem: item)
                    }
                   
                    
                }
            }
        }
    }
}

struct SectionHeaderView: View {
    var sectionTitle: String
    var body: some View {
        HStack {
            Text(sectionTitle)
                .font(.custom(.semibold, size: 16))     .foregroundColor(.black)
            Spacer()
            Button("View all") {
                
            }
            .font(.custom(.medium, size: 11))
            .foregroundColor(Colors.grayColor)
        }
    }
}
