//
//  Home.swift
//  UI-333 (iOS)
//
//  Created by nyannyan0328 on 2021/10/18.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing:20){
                    
                    
                    ForEach(1...5,id:\.self){index in
                        
                        
                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: getRect().width - 30, height: 250)
                            .cornerRadius(10)
                        
                        
                        
                    }
                    
                    
                }
                .padding(20)
                .navigationBarTitle("Trending Post")
                
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
