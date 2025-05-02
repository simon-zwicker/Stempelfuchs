//
//  OnboardingName.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 02.05.25.
//

import SwiftUI

struct OnboardingName: View {
    
	@Environment(\.onboardingModel) private var model

    var body: some View {
		@Bindable var model = model

		VStack(spacing: 40) {
			VStack {
				Text("Wie soll ich dich nennen?")
					.font(.Regular.regular)
					.foregroundStyle(.secondary)

				TextField("Name eingeben", text: $model.name)
					.font(.Bold.regularSmall)
					.padding()
					.overlay {
						RoundedRectangle(cornerRadius: 10)
							.stroke(.main, lineWidth: 2)
					}
			}

			VStack {
				Text("In welchem Bundesland arbeitest du?")
					.font(.Regular.regular)
					.foregroundStyle(.secondary)

				Menu(content: {
					ForEach(FederalState.allCases) { state in
						HStack {
							Text(state.name)
							Spacer()
							if state == model.federalState {
								Image(systemName: "checkmark")
							}
						}
						.tint(.main)
						.button {
							model.federalState = state
						}
					}
				}, label: {
					HStack {
						Text(model.federalState.name)
							.font(.Bold.regularSmall)
						Spacer()
						Image(systemName: "chevron.down")
							.foregroundStyle(.secondary)
							.font(.Regular.regularSmall)
					}
					.foregroundStyle(.black)
				})
				.pickerStyle(.navigationLink)
				.padding()
				.frame(maxWidth: .infinity)
				.overlay {
					RoundedRectangle(cornerRadius: 10)
						.stroke(.main, lineWidth: 2)
				}

				Text("Wird benötigt um die Feiertage zu ermitteln.\n\nEs gilt immer der Ort wo die Arbeitsleistung tatsächlich erbracht wird. (§ 9 Abs. 1 ArbZG)")
					.font(.Bold.verySmall)
					.foregroundStyle(.secondary)
					.padding(.top, 10)
			}
		}
		.padding(.horizontal, 35)
    }
}

#Preview {
	@Previewable @State var model: OnboardingModel = .init()
	OnboardingName()
		.environment(model)
}
