//
//  HomeScreen.swift
//  Furniture_app
//
//  Created by Santanu Agarwal on 04/12/22.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading){
                        
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchView()
                        
                        CategoryScrollView()
                        
                        Text("Popular")
                            .font(.custom("PlayFairDisplay-Bold", size: 24))
                            .padding(.leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0){
                                ForEach(0 ..< 4 ) { index in
                                    NavigationLink {
                                        ContentView()
                                    } label: {
                                        ProductCardView(image: Image("chair_\(index+1)"), size: 210)
                                    }
                                    .navigationBarHidden(true)
                                   
                                }
                            }
                        }
                        
                        Text("Best")
                            .font(.custom("PlayFairDisplay-Bold", size: 24))
                            .padding([.leading, .top])
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0){
                                ForEach(0 ..< 4 ) { index in
                                    NavigationLink {
                                        ContentView()
                                    } label: {
                                        ProductCardView(image: Image("chair_\(index+1)"), size: 210)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 50)
                }
                
                HStack{
                    BottomNavBarItem(image: Image("Home")){}
                    BottomNavBarItem(image: Image("User")){}
                    BottomNavBarItem(image: Image("Home")){}
                    BottomNavBarItem(image: Image("User")){}
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}



struct AppBarView: View {
    var body: some View {
        HStack{
            Button {
            } label: {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            Spacer()
            Button {
                
            } label: {
                Image("User")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayFairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        +
        Text("Furniture")
            .font(.custom("PlayFairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchView: View {
    @State var searchText: String = ""
    var body: some View {
        HStack {
            
            HStack{
                Image("Search")
                    .foregroundColor(Color("Primary"))
                    .padding(.trailing)
                TextField("Search Furniture", text: $searchText)
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.trailing)
            
            Image("Scan")
                .padding()
                .foregroundColor(.white)
                .background(Color("Primary"))
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

struct CategoryScrollView: View {
    
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(categories.indices) { i in
                    CategoryView(isActive: selectedIndex == i, text: categories[i])
                        .onTapGesture {
                            selectedIndex = i
                        }
                }
            }
            .padding()
        }
    }
}

struct CategoryView: View {
    
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"): Color.black)
            if isActive{
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20)
            Text("Luxury Sweden Chair")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.black)
            HStack{
                ForEach(0..<5) { _ in
                    Image("star")
                }
                Spacer()
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

struct BottomNavBarItem: View {
    
    let image: Image
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}

