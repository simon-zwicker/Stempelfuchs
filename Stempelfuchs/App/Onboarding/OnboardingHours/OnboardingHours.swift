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
			Text("Stunden pro Woche")
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

			Text("\(model.workTimeDayHour):\(model.workTimeDayMinute)\(model.workTimeDayMinute > 0 ? "": "0") pro Tag")
				.font(.Bold.small)
				.contentTransition(.numericText(value: model.workTimePerDay))

			Text("Wochentage")
				.foregroundStyle(.secondary)
				.padding(.top, 15)
				.padding(.bottom, 10)

			LazyVGrid(columns: 2.grid, spacing: 20) {
				ForEach(Days.allCases) { day in
					HStack {
						Rectangle()
							.fill(model.dayButtonFilled(for: day))
							.stroke(
								model.dayButtonStroke(for: day).color,
								lineWidth: model.dayButtonStroke(for: day).stroke
							)
							.frame(width: 20, height: 20)
							.overlay {
								Image(systemName: "checkmark")
									.font(.Bold.small)
									.foregroundStyle(.white)
									.opacity(model.workDays.contains(day) ? 1.0: 0.0)
							}

						Text(day.name)
							.font(.Bold.regular)
							.foregroundStyle(.black)

						Spacer()
					}
					.frame(maxWidth: .infinity)
					.button {
						withAnimation {
							model.toggleDay(day)
						}
					}
					.disabled(model.dayButtonDisabled(for: day))
				}
			}
			.padding(.horizontal, 30)
		}
		.padding()
	}
}

#Preview {
	@Previewable @State var model: OnboardingModel = .init()
	OnboardingHours()
		.environment(model)
}
