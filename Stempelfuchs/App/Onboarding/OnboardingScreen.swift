//
//  OnboardingScreen].swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 02.05.25.
//

import SwiftUI

// Name, Arbeitszeit Woche, Arbeitstage, Urlaubstage, Aktueller Stand Zeitkonto

struct OnboardingScreen: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(.sfLogo)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
            
            Text("Stempelfuchs")
                .font(.Bold.heading1)
            
            TabView {
                OnboardingName()
                Text("Wochenarbeitszeit eingeben")
                Text("ARbeitstage angeben")
                Text("Urlaubstage")
                Text("Aktuelles Zeitkonto")
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            Text("Weiter")
                .font(.Bold.regular)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(15)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.main)
                )
                .padding(.vertical)
                .padding(.horizontal, 30)
        }
    }
}

#Preview {
    OnboardingScreen()
}
