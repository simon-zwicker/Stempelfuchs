//
//  TimerView.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 04.05.25.
//

import SwiftUI

struct  TimerComponent: View {

	// MARK: - Properties
    @Environment(\.modelContext) private var context
	@Environment(\.timerModel) private var model
    @Binding var current: TimeEntry?
    
    var isRunning: Bool {
        current.isNotNil && current?.isPause == false
    }
    
    var isPauseRunning: Bool {
        model.showPauseTime && model.paused
    }

	// MARK: - View Body
	var body: some View {
		VStack(spacing: 0) {
			HStack {
				Text(model.timeElapsed.elapsedHoursMinutes)
					.font(.Bold.extraLarge)

				Text(model.timeElapsed.elapsedSeconds)
					.font(.Bold.regularSmall)
					.padding(.top, 25)
					.frame(width: 20)
			}
			.padding(.vertical, 10)
			.foregroundStyle(isRunning ? .primary: .secondary)
			.frame(maxWidth: .infinity)

			if model.showPauseTime {
				HStack {
					Text(model.timePauseElapsed.elapsedHoursMinutes)
						.font(.Bold.regular)

					Text(model.timePauseElapsed.elapsedSeconds)
						.font(.Bold.verySmall)
						.offset(x: -5, y: 2)
						.frame(width: 15)
				}
				.foregroundStyle(isPauseRunning ? .primary: .secondary)
				.frame(maxWidth: .infinity)
				.padding(.bottom, 15)
			}

			HStack {
				HStack {
					Image(systemName: isRunning ? "pause.fill": "play.fill")
					Text(isRunning ? "Pause": "Start")
				}
				.font(.Bold.title)
				.padding()
				.frame(maxWidth: .infinity)
				.foregroundStyle(isRunning ? .blue: .green)
				.background(
					RoundedRectangle(cornerRadius: 10)
						.fill(isRunning ? Color.blue.opacity(0.2): Color.green.opacity(0.2))
						.stroke(isRunning ? Color.blue: Color.green, lineWidth: 2)
				)
				.button {
					withAnimation {
						checkStartOrPause()
					}
				}

				if !model.paused && model.timer.isNotNil {
					HStack {
						Image(systemName: "stop.fill")
						Text("Beenden")
					}
					.font(.Bold.title)
					.padding()
					.frame(maxWidth: .infinity)
					.foregroundStyle(.pink)
					.background(
						RoundedRectangle(cornerRadius: 10)
							.fill(.pink.opacity(0.2))
							.stroke(.pink, lineWidth: 2)
					)
					.button {
						withAnimation {
							stop()
						}
					}
				}
			}
		}
	}
    
    // MARK: - Helpers
    private func checkStartOrPause() {
        current.isNotNil ? pause(): start()
    }
    
    private func start() {
        let entry: TimeEntry = .init()
        context.insert(entry)
        try? context.save()
        
        current = entry
        model.start()
    }
    
    private func pause() {
        current?.endedAt = .now
        try? context.save()
        
        let entry: TimeEntry = .init(isPause: current?.isPause == true ? false: true)
        context.insert(entry)
        try? context.save()
        
        current = entry
		model.pauseStart(state: entry.isPause)
    }
    
    private func stop() {
        if current?.isPause == false {
            current?.endedAt = .now
            try? context.save()
        }
        current = nil
        model.stop()
		model.clear()
    }
}
