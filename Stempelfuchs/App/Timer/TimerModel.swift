//
//  TimerModel.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 04.05.25.
//

import Foundation

@Observable
class TimerModel {

	// MARK: - Properties
	private(set) var timeElapsed: TimeInterval = 0
	private(set) var timer: Timer?
	private(set) var paused: Bool = false

	// MARK: - Computed Properties
	var isRunning: Bool { timer.isNotNil && !paused }

	// MARK: - Init & Deinit
	init() {

	}

	deinit {
		stop()
	}

	// MARK: - Helper Functions
	func start() {
		stop()
		timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
			if !self.paused {
				self.timeElapsed += 1
			}
		}
	}

	func stop() {
		timer?.invalidate()
		timer = nil
		timeElapsed = 0
		paused = false
	}

	func pause() {
		paused.toggle()
	}
}
