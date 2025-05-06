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
		clear()
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
	}

	func clear() {
		timeElapsed = 0
		timePauseElapsed = 0
		showPauseTime = false
		paused = false
	}

	func pauseStart(state: Bool) {
		pauseStop()
        showPauseTime = true
		paused = state
		pauseTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
			if self.paused {
				self.timePauseElapsed += 1
			}
		}

		if !state {
			start()
		}
	}

	func pauseStop() {
		pauseTimer?.invalidate()
		pauseTimer = nil
		paused = false
	}

	func startFromBackground(with entries: [TimeEntry]) {
		var pauseTime: TimeInterval = 0
		var workTime: TimeInterval = 0

		for entry in entries {
			if let ended = entry.endedAt {
				workTime += entry.isPause ? 0: ended - entry.startedAt
				pauseTime += entry.isPause ? ended - entry.startedAt : 0
			} else {
				workTime += entry.isPause ? 0: Date.now.timeIntervalSince1970 - entry.startedAt
				pauseTime += entry.isPause ? Date.now.timeIntervalSince1970 - entry.startedAt : 0
			}

			if entry.isPause {
				showPauseTime = true
			}
		}

		timeElapsed = workTime
		timePauseElapsed = pauseTime

		if let last = entries.last, last.endedAt.isNil {
			last.isPause ? pauseStart(state: true) : start()
		}
	}
}
