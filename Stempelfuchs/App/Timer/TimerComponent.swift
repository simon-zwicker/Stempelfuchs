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
	@State private var model: TimerModel = .init()
    @Binding var current: TimeEntry?
    
    var isRunning: Bool {
        current.isNotNil && current?.isPause == false
    }

	// MARK: - View Body
	var body: some View {
		VStack {
			HStack {
				Text(model.timeElapsed.hourMinuteString)
					.font(.Bold.extraLarge)

				Text(model.timeElapsed.secondsString)
					.font(.Bold.regularSmall)
					.padding(.top, 25)
					.frame(width: 20)
			}
			.foregroundStyle(isRunning ? .primary: .secondary)
			.frame(maxWidth: .infinity)

			HStack {
				Image(systemName: isRunning ? "pause.fill": "play.fill")
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
							startPause()
						}
					}

				if model.timer.isNotNil {
					Image(systemName: "stop.fill")
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
        .onAppear {
            try? context.delete(model: TimeEntry.self)
        }
	}
    
    // MARK: - Helpers
    private func startPause() {
        current.isNotNil ? pause(): start()
    }
    
    private func start() {
        let entry: TimeEntry = .init()
        context.insert(entry)
        try? context.save()
        
        current = entry
        model.start(from: entry.startedAt)
    }
    
    private func pause() {
        current?.endedAt = .now
        try? context.save()
        
        let entry: TimeEntry = .init(isPause: current?.isPause == true ? false: true)
        context.insert(entry)
        try? context.save()
        
        current = entry
        model.pause()
    }
    
    private func stop() {
        if current?.isPause == false {
            current?.endedAt = .now
            try? context.save()
        }
        current = nil
        model.stop()
    }
}
