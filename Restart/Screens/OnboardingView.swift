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
    
    // MARK: - Body
    
    var body: some View {
        ZStack{
            
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 10){
                
                // MARK : - Header
                
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
                
                // MARK : - Center
                
                ZStack{
                    ZStack{
                        Circle()
                            .stroke(.white.opacity(0.2), lineWidth: 40)
                            .frame(width: 260, height: 260 , alignment: .center)
                        Circle()
                            .stroke(.white.opacity(0.2), lineWidth: 80)
                            .frame(width: 260, height: 260 , alignment: .center)
                    }//:ZStack
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                    
                }//:Center
                
                Spacer()
                
                // MARK : - Footer
                
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
                        .frame(width: 80)
                        
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
                    .onTapGesture {
                        isOnboardingViewActive = false
                    }
                    
                    Spacer()

                  }//:HStack
                }//:Footer
                .frame(height: 80, alignment: .center)
                .padding()
                
            } //:VStack
        }//:ZStack
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
