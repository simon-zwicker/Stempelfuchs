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
    private(set) var timePauseElapsed: TimeInterval = 0
	private(set) var timer: Timer?
    private(set) var pauseTimer: Timer?
	private(set) var paused: Bool = false
    private(set) var showPauseTime: Bool = false

	// MARK: - Init & Deinit
	init() {

	}

	deinit {
		stop()
	}

	// MARK: - Helper Functions
    func start(from startTime: TimeInterval) {
		stop()
        timeElapsed = Date.now.timeIntervalSince1970 - startTime
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
        timePauseElapsed = 0
        showPauseTime = false
		paused = false
	}

	func pause() {
		paused.toggle()
        pauseTimer?.invalidate()
        pauseTimer = nil
        showPauseTime = true
        if paused {
            pauseTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if self.paused {
                    self.timePauseElapsed += 1
                }
            }
        }
	}
}
