//
//  OnboardingTimeAccount.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 03.05.25.
//

import SwiftUI

struct OnboardingTimeAccount: View {

	// MARK: - Properties

	@Environment(\.onboardingModel) private var model

	// MARK: - View Body

	var body: some View {

		@Bindable var model = model

		VStack {
			Text("Aktuelles Zeitkonto in Minuten")
				.foregroundStyle(.secondary)

			TextField("Minuten", text: $model.timeAccount)
				.keyboardType(.numberPad)
				.font(.Bold.heading1)
				.multilineTextAlignment(.center)
				.padding()
				.overlay {
					RoundedRectangle(cornerRadius: 10)
						.stroke(.main, lineWidth: 2)
				}

			Toggle("Angabe im Minus", isOn: $model.isTimeAccountNegative)
				.padding(.top, 15)
				.foregroundStyle(.secondary)
				.tint(.main)
		}
		.padding(.horizontal, 35)
	}
}

#Preview {
	@Previewable @State var model = OnboardingModel()
	OnboardingTimeAccount()
		.environment(model)
}
