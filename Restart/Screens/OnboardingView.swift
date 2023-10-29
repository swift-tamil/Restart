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
        VStack(spacing: 20){
            Text("Onboarding")
                .font(.largeTitle)
            Button {
                isOnboardingViewActive = false
            } label: {
                Text("Start")
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
