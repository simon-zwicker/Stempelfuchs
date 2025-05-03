//
//  OnboardingScreen].swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 02.05.25.
//

import SwiftUI

// Name, Arbeitszeit Woche, Arbeitstage, Urlaubstage, Aktueller Stand Zeitkonto

struct OnboardingScreen: View {

	// MARK: - Properties

	@AppStorage("showOnboarding") private var showOnboarding: Bool = true
	@State private var model: OnboardingModel = .init()

	// MARK: - View Body

    var body: some View {
		ZStack {
			ScrollView {
				Image(.sfLogo)
					.resizable()
					.scaledToFit()
					.frame(height: 100)

				Text("Stempelfuchs")
					.font(.Bold.heading1)

				model.currentStep.view
					.padding(.top, 50)
			}

			VStack {
				Spacer()

				VStack {

					Text("Alle persönliches Angaben werden nur lokal gespeichert.")
						.font(.Bold.verySmall)
						.padding(.top, 15)

					VStack {
						Text(model.currentStep != .timeAccount ? "Weiter": "Los geht's")
							.font(.Bold.regular)
							.foregroundStyle(.white)
							.frame(maxWidth: .infinity)
							.padding(15)
							.button {
								withAnimation {
									if model.currentStep == .timeAccount {
										showOnboarding = false
									}
									model.nextStep()
								}
							}
							.disabled(!model.isButtonActive)
					}
					.padding(.top, 5)
					.background(model.isButtonActive ? .main: .secondary)
				}
				.background(.white)
			}
			.frame(maxWidth: .infinity)
//			.ignoresSafeArea(.keyboard)
		}
		.onTapGesture {
			hideKeyboard()
		}
		.environment(\.onboardingModel, model)
    }
}

#Preview {
    OnboardingScreen()
}
