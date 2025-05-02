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

	@State private var model: OnboardingModel = .init()

	// MARK: - View Body

    var body: some View {
		ZStack {
			ScrollView {
				Image(.sfLogo)
					.resizable()
					.scaledToFit()
					.frame(height: 150)

				Text("Stempelfuchs")
					.font(.Bold.heading1)
					.padding(.top, -25)

				model.currentStep.view
					.padding(.top, 50)
			}

			VStack {
				Spacer()

				Text("Alle persönliches Angaben werden nur lokal gespeichert.")
					.font(.Bold.verySmall)
					.padding(.top, 10)

				VStack {
					Text("Weiter")
						.font(.Bold.regular)
						.foregroundStyle(.white)
						.frame(maxWidth: .infinity)
						.padding(15)
						.button {
							withAnimation {
								model.nextStep()
							}
						}
						.disabled(!model.isButtonActive)
				}
				.padding(.top, 10)
				.background(model.isButtonActive ? .main: .secondary)
			}
//			.offset(y: 20)
			.frame(maxWidth: .infinity)
			.ignoresSafeArea(.keyboard)
		}
		.environment(\.onboardingModel, model)
    }
}

#Preview {
    OnboardingScreen()
}
