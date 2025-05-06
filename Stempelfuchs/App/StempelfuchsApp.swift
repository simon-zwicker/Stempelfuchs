//
//  StempelfuchsApp.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 02.05.25.
//

import SwiftUI
import Octopus
import SwiftData

@main
struct StempelfuchsApp: App {

	// MARK: - Properties
	@AppStorage("showOnboarding") private var showOnboarding: Bool = true

    var body: some Scene {
		WindowGroup {
			Group {
				if showOnboarding {
					OnboardingScreen()
				} else {
					DashboardScreen()
				}
			}
        }
        .modelContainer(for: [TimeEntry.self])
    }
}
