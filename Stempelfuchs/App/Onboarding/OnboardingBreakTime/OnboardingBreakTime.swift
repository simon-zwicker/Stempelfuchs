//
//  OnboardingBreakTime.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 03.05.25.
//

import SwiftUI

struct OnboardingBreakTime: View {

	// MARK: - Properties

	@Environment(\.onboardingModel) private var model

	var body: some View {
		Text("BreakTime")
	}
}

#Preview {
	OnboardingBreakTime()
}
