//
//  OnboardingHours.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 02.05.25.
//

import SwiftUI

struct OnboardingHours: View {

	// MARK: - Properties

	@Environment(\.onboardingModel) private var model

	// MARK: - View Body

	var body: some View {
		@Bindable var model = model

		VStack {
			Text("Wochenarbeitsstunden")
				.foregroundStyle(.secondary)

			HStack {
				Image(systemName: "minus")
					.font(.Bold.title4)
					.frame(width: 50, height: 35)
					.foregroundStyle(.main)
					.button {
						withAnimation {
							model.timeDown()
						}
					}
					.frame(maxWidth: .infinity)

				Text(model.weekHours, format: .number.precision(.fractionLength(1)))
					.contentTransition(.numericText(value: model.weekHours))
					.font(.Bold.extraLarge)
					.frame(width: 150)
					.frame(maxWidth: .infinity)

				Image(systemName: "plus")
					.font(.Bold.title4)
					.frame(width: 50, height: 35)
					.foregroundStyle(.main)
					.button {
						withAnimation {
							model.timeUp()
						}
					}
					.frame(maxWidth: .infinity)
			}

			VStack(spacing: 25) {
				Text("Wochentage")
					.foregroundStyle(.secondary)

				HStack {
					ForEach(Days.defaultDays) { day in
						HStack {
							Rectangle()
								.fill(model.workDays.contains(day) ? .main: .clear)
								.stroke(.main, lineWidth: 2)
								.frame(width: 20, height: 20)
								.overlay {
									Image(systemName: "checkmark")
										.font(.Bold.small)
										.foregroundStyle(.white)
										.opacity(model.workDays.contains(day) ? 1.0: 0.0)
								}

							Text(day.rawValue)
								.font(.Bold.regular)
								.foregroundStyle(.black)
						}
						.frame(maxWidth: .infinity)
						.button {
							withAnimation {
								model.toggleDay(day)
							}
						}
					}
				}
			}
			.padding(.vertical, 30)

			VStack(spacing: 25) {
				Text("Wochenendtage")
					.foregroundStyle(.secondary)

				HStack {
					ForEach(Days.weekendDays) { day in
						HStack {
							Rectangle()
								.fill(model.workDays.contains(day) ? .main: .clear)
								.stroke(.main, lineWidth: 2)
								.frame(width: 20, height: 20)
								.overlay {
									Image(systemName: "checkmark")
										.font(.Bold.small)
										.foregroundStyle(.white)
										.opacity(model.workDays.contains(day) ? 1.0: 0.0)
								}

							Text(day.rawValue)
								.font(.Bold.regular)
								.foregroundStyle(.black)
						}
						.frame(maxWidth: .infinity)
						.button {
							withAnimation {
								model.toggleDay(day)
							}
						}
					}
				}
			}
		}
		.padding()
	}
}

#Preview {
	@Previewable @State var model: OnboardingModel = .init()
	OnboardingHours()
		.environment(model)
}
