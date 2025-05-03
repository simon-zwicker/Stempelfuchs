//
//  OnboardingModel.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 02.05.25.
//

import SwiftUI

@Observable
class OnboardingModel: ObservableObject {

	// MARK: - Properties

	var currentStep: OnboardingStep = .name
	var name: String = ""
	var federalState: FederalState = .bw
	var weekHours: Double = 40.0
	var workDays: [Days] = Days.defaultDays

	var isButtonActive: Bool { validate() }
	var isTimeUpButtonActive: Bool { weekHours < 60.0 }
	var isTimeDownButtonActive: Bool { weekHours > 0.0 }

	var workTimePerDay: Double { weekHours / workDays.count.toDouble }
	var workTimeDayHour: Int { Int(workTimePerDay.rounded(.towardZero)) }
	var workTimeDayMinute: Int {
		let restMinute = workTimePerDay - workTimeDayHour.toDouble
		return restMinute.isZero ? 0: Int(restMinute * 60)
	}

	// MARK: - Helper Functions

	func nextStep() {
		currentStep = currentStep.nextStep
	}

	func validate() -> Bool {
		switch currentStep {
		case .name: !name.isEmpty
		case .workHours: workDays.count > 0
		default: false
		}
	}

	func timeUp() {
		weekHours += 0.5
	}

	func timeDown() {
		weekHours -= 0.5
	}

	func dayButtonDisabled(for day: Days) -> Bool {
		workDays.count > 5 && !workDays.contains(day) || workDays.count == 1 && workDays.contains(day)
	}

	func dayButtonFilled(for day: Days) -> Color {
		var color: Color = .clear
		if workDays.contains(day) {
			color = dayButtonDisabled(for: day) ? .secondary: .main
		}
		return color
	}

	func dayButtonStroke(for day: Days) -> (color: Color, stroke: CGFloat) {
		let color: Color = dayButtonDisabled(for: day) ? .secondary: .main
		let stroke: CGFloat = workDays.contains(day) ? 0.0: 2.0
		return (color: color, stroke: stroke)
	}

	func toggleDay(_ day: Days) {
		guard !dayButtonDisabled(for: day) else { return }

		if !workDays.contains(day) {
			workDays.append(day)
			return
		}

		if workDays.count > 1 {
			workDays.removeAll(where: { $0 == day })
		}
	}
}
