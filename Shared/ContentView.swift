//
//  ContentView.swift
//  Shared
//
//  Created by nyannyan0328 on 2021/10/18.
//

import SwiftUI

struct ContentView: View {
    @State var endAnimation : Bool = false
    var body: some View {
        ZStack{
            
            Home()
                .offset(y: endAnimation ? 0 : getRect().height)
            
            SplashScreen(endAnimation: $endAnimation)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        
      guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            
            return .zero
        }
        return safeArea
    }
}
