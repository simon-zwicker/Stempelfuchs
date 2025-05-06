//
//  TimebookingVIew.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 04.05.25.
//

import SwiftUI
import SwiftData

struct TimebookingView: View {

	// MARK: - Properties
	@State private var timerModel: TimerModel = .init()
	@Query(sort: \TimeEntry.startedAt) private var entries: [TimeEntry]
	@State var currentEntry: TimeEntry?
	var todayEntries: [TimeEntry] {
		entries.filter { Date(timeIntervalSince1970: $0.startedAt).isToday }
	}

	// MARK: - View Body
	var body: some View {
		VStack(spacing: 30) {
			TimerComponent(current: $currentEntry)
			TimebookingWeek()

			LazyVStack {
				ForEach(entries) { entry in
					HStack {
						if let ended = entry.endedAt {
							Text(entry.startedAt.hoursMinutes)
							Spacer()
							Text(ended.hoursMinutes)
						}
					}
				}
			}

			Spacer()
		}
		.environment(\.timerModel, timerModel)
		.padding(.top, 20)
		.padding()
		.onAppear {
			checkCurrent()
		}
	}

	private func checkCurrent() {
		guard let last = todayEntries.last else { return }
		if last.endedAt.isNil {
			currentEntry = last
		}
		timerModel.startFromBackground(with: todayEntries)
	}
}

#Preview {
	@Previewable @State var entry: TimeEntry? = nil
	TimebookingView()
}
