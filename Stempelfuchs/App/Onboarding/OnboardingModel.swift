//
//  OnboardingModel.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 02.05.25.
//

import Foundation

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

	func toggleDay(_ day: Days) {
		if workDays.contains(day) {
			workDays.removeAll(where: { $0 == day })
		} else {
			workDays.append(day)
		}
	}
}
