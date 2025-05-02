//
//  OnboardingName.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 02.05.25.
//

import SwiftUI

struct OnboardingName: View {
    
    @State var name: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Wie soll ich dich nennen?")
                .font(.Regular.regular)
                .foregroundStyle(.secondary)
            
            TextField("Name eingeben", text: $name)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.main, lineWidth: 2)
                }
        }
        .padding(.horizontal, 35)
    }
}

#Preview {
    OnboardingName()
}
