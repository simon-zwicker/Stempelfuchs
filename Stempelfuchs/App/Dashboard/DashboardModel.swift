//
//  DashboardModel.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 03.05.25.
//

import Foundation

@Observable
class DashboardModel {

	// MARK: - Properties
	var setting: Settings = .empty
	private(set) var timeElapsed: TimeInterval = 0
	private(set) var timer: Timer?
	private(set) var paused: Bool = false

	// MARK: - Computed Properties
	var timerIsRunning: Bool {
		timer.isNotNil && !paused
	}

	// MARK: - Initializer
	init() {
		fetchSettings()
	}

	deinit {
		stopTimer()
	}

	// MARK: - Helper Functions
	private func fetchSettings() {
		do {
			guard let data = try KeychainEntry.settings.getData?.decode(Settings.self) else { return }
			self.setting = data
		} catch {
			print("No Settings was loaded from Keychain")
		}
	}

	func startTimer() {
		stopTimer()
		timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
			if !self.paused {
				self.timeElapsed += 1
			}
		}
	}

	func stopTimer() {
		timer?.invalidate()
		timer = nil
	}

	func pausedTimer() {
		paused.toggle()
	}
}
