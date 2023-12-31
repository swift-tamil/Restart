//
//  OnboardingView.swift
//  Restart
//
//  Created by python on 29/10/23.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - Property
    
    @AppStorage("onboarding") var isOnboardingViewActive : Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width-80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        ZStack{
            
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 10){
                
                // MARK: - Header
                
                Spacer()
                
                VStack(spacing: 0){
                    Text("Share.")
                        .fontWeight(.heavy)
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                    
                    Text("""
                         It's not to how much we give but
                         how much love we put into giving.
                        """)
                    .fontWeight(.light)
                    .font(.title3)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    
                    
                } //:Header
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                // MARK: - Center
                
                ZStack{
                  
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                    
                }//:Center
                
                Spacer()
                
                // MARK: - Footer
                
                ZStack{
                    // Parts of Custom Button
                    
                    // 1. Background (Static)
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. Call to action (Static)

                    Text("Get Started")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .offset(x:20)
                    
                    // 3. Capsule Dynamic width
                    
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                        .frame(width: buttonOffset + 80)
                        
                        Spacer()
                         
                    }//: HStack
                                        
                    // 4. Circle (Draggable)
                    
                    HStack{
                      ZStack{
                        
                        Circle()
                            .fill(Color("ColorRed"))
                        Circle()
                            .fill(.black.opacity(0.15))
                            .padding(8)
                        Image(systemName: "chevron.right.2")
                            .font(.system(size: 24, weight: .bold))
                        
                    }//:ZStack
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80, alignment: .center)
                    .offset(x: buttonOffset)
                    .gesture(DragGesture()
                        .onChanged({ gesture in
                            if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80{
                                buttonOffset = gesture.translation.width
                            }
                        })
                        .onEnded({ _ in
                            withAnimation(Animation.easeInOut(duration: 2)){
                                if buttonOffset > buttonWidth/2 {
                                    buttonOffset = buttonWidth - 80
                                    isOnboardingViewActive = false
                                }
                                else{
                                    buttonOffset = 0
                                }
                            }
                        })
                    )
                    
                    Spacer()

                  }//:HStack
                }//:Footer
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
            } //:VStack
        }//:ZStack
        .onAppear {
            isAnimating = true
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
