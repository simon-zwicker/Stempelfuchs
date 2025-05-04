//
//  DashboardScreen.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 03.05.25.
//

import SwiftUI

struct DashboardScreen: View {

	// MARK: - Properties

	@State private var model: DashboardModel = .init()

	// MARK: - View Body
	var body: some View {
		VStack {
			HStack(spacing: 15) {
				Image(.sfLogo)
					.resizable()
					.scaledToFit()
					.frame(width: 50)

				Text("Hallo \(model.setting.name)")
					.font(.Bold.heading1)

				Spacer()
			}
			.padding()

			MenuComponent()

			ScrollView {
				LazyVStack {
					TimerComponent()
				}
				.padding()
			}
			.scrollIndicators(.hidden)
		}
		.environment(\.dashboardModel, model)
		.onAppear {
			print(model.setting)
		}
	}
}

#Preview {
	DashboardScreen()
}
