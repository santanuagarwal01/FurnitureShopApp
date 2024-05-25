//
//  ContentView.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        ZStack{
            
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                Image("chair_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
                
                DescriptionView()
                    .offset(y: -40)
            }
            
            HStack {
                Text("$1299")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Add to cart")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Primary"))
                }
                .padding()
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(12)
                
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(90, corners: [.topLeft])
            .frame(maxHeight: .infinity, alignment: .bottom)
            
        }
        .ignoresSafeArea()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DescriptionView: View {
    
    @State private var qty: Int = 1
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("Luxury Swedia \nChair")
                .font(.title)
                .bold()
            
            HStack{
                ForEach(0..<5) { i in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 5)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text("mdeiwhfcnwqkodsmecn   bnfuedncnew cbnen cb hbednncjknwecbb bfewnnxjnjrefdnjhv bhvnbfenfuhnvn vbucncjbvhib.")
                .lineSpacing(8)
                .opacity(0.5)
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading){
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Height : 120 cm")
                        .opacity(0.5)
                    Text("Wide : 80 cm")
                        .opacity(0.5)
                    Text("Height : 72 cm")
                        .opacity(0.5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading){
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Jati wood, Canvas,\nAmazing Love")
                        .opacity(0.5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 8)
            
            
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading){
                    
                    Text("Colors")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    HStack{
                        Color.white
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                        Color.black
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                        Color.blue
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading){
                    
                    Text("Quantity")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    HStack(alignment: .center, spacing: 12){
                        Button {
                            if qty > 0 {
                                qty -= 1
                            }
                        } label: {
                            Image(systemName: "minus")
                                .frame(width: 30, height: 30)
                                .overlay(Circle().stroke())
                                .foregroundColor(.black)
                        }
                        
                        Text("\(qty)")
                            .fontWeight(.semibold)
                            .font(.title2)
                        
                        Button {
                            if qty <= 5 {
                                qty += 1
                            }
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                                .background(Color("Primary"))
                                .clipShape(Circle())
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 8)
            
        }
        .padding()
        .padding(.top)
        .padding(.bottom, 40)
        .background(Color("Bg"))
        .cornerRadius(40)
    }
}


struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
