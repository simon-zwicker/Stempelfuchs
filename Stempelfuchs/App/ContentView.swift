//
//  ContentView.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 02.05.25.
//

import SwiftUI

struct ContentView: View {
    @State private var emails = ["Email 1", "Email 2", "Email 3"]
    @State private var isMoreActionTapped = false
    @State private var selectedEmail: String? = nil

    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Image(.sfLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                
                Text("Stempelfuchs")
                    .font(.headline.bold())
                
                Spacer()
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
