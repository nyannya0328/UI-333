//
//  SplashScreen.swift
//  UI-333 (iOS)
//
//  Created by nyannyan0328 on 2021/10/18.
//

import SwiftUI

struct SplashScreen: View {
    @State var startAnimation : Bool = false
    @State var circleAnimation1 : Bool = false
    @State var  circleAnimation2 : Bool = false
    
    @Binding var endAnimation : Bool
    var body: some View {
        ZStack{
            
            Color("SplashColor")
            
            
            Group{
                
                CustomShape()
               .trim(from: 0, to: startAnimation ? 1 : 0)
                    .stroke(Color.white,style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                
                  Circle()
                    .fill(Color.white)
                    .frame(width: 35, height: 35)
                    .opacity(circleAnimation1 ? 1 : 0)
                    .offset(x: -80, y: 22)
                
                Circle()
                  .fill(Color.white)
                  .frame(width: 35, height: 35)
                  .opacity(circleAnimation2 ? 1 : 0)
                  .offset(x: 80, y: -22)
                
            }
            .frame(width: 220, height: 130)
            .scaleEffect(endAnimation ? 0.5 :1)
            .rotationEffect(.init(degrees: endAnimation ? 90 : 0))
            
            
            VStack(spacing:15){
                
                
                Text("Powed By")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                
                Text("Kavosft")
                    .font(.largeTitle.bold())
                    .foregroundColor(.green)
                
                
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom,getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
            .opacity(startAnimation ? 1 : 0)
            .opacity(endAnimation ? 0 : 1)
          
            
            
        }
        .offset(y: endAnimation ? -(getRect().height * 1.5) : 0)
        .ignoresSafeArea()
        .onAppear {
            
            withAnimation(.spring().delay(0.15)){
                
                circleAnimation1.toggle()
            }
            
            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1, blendDuration: 0.1).delay(0.3)){
                
                
               
                
                startAnimation.toggle()
            }
            
            withAnimation(.spring().delay(0.7)){
                
                circleAnimation2.toggle()
            }
            
            withAnimation(.easeOut(duration: 0.5).delay(1.1)){
                
                endAnimation.toggle()
            }
            
            
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomShape : Shape{
    
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            let mid = rect.width / 2
            let height = rect.height
            
            path.move(to: CGPoint(x: mid - 80, y: height))
            
            path.addArc(center: CGPoint(x: mid - 40, y: height), radius: 40, startAngle: .init(degrees: 180), endAngle: .init(degrees: 0), clockwise: true)
            
            path.move(to: CGPoint(x: mid, y: height))
            path.addLine(to: CGPoint(x: mid, y: 0))
            
            
            path.addArc(center: CGPoint(x: mid + 40, y: 0), radius: 40, startAngle: .init(degrees: 180), endAngle: .init(degrees: 0), clockwise: false)
            
            
        }
    }
}
