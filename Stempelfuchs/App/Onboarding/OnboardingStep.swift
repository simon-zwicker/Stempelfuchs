//
//  OnboardingStep.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 02.05.25.
//

import SwiftUI

enum OnboardingStep: CaseIterable, Identifiable {

	var id: Self { self }

	case name
	case workHours
	case timeAccount
}

extension OnboardingStep {

	@ViewBuilder
	var view: some View {
		Group {
			switch self {
			case .name: OnboardingName()
			case .workHours: OnboardingHours()
			case .timeAccount: OnboardingTimeAccount()
			}
		}
	}

	var nextStep: Self {
		switch self {
		case .name: .workHours
		case .workHours: .timeAccount
		case .timeAccount: .timeAccount
		}
	}
}
