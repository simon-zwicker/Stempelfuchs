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

			HStack {
				VStack(spacing: 10) {
					Text("Feierabend um")
						.font(.Regular.verySmall)
						.foregroundStyle(.secondary)
					Text("--:--")
						.font(.Bold.regular)
				}
				.padding()
				.frame(height: 80)
				.frame(maxWidth: .infinity)
				.background(
					RoundedRectangle(cornerRadius: 10)
						.fill(.secondary.opacity(0.05))
						.stroke(.secondary, lineWidth: 2)
				)

				VStack(spacing: 10) {
					Text("Pause")
						.font(.Regular.verySmall)
						.foregroundStyle(.secondary)
					Text("--:--")
						.font(.Bold.regular)
				}
				.padding()
				.frame(height: 80)
				.frame(maxWidth: .infinity)
				.background(
					RoundedRectangle(cornerRadius: 10)
						.fill(.secondary.opacity(0.05))
						.stroke(.secondary, lineWidth: 2)
				)

				VStack(spacing: 10) {
					Text("Heute")
						.font(.Regular.verySmall)
						.foregroundStyle(.secondary)
					Text("-")
						.minimumScaleFactor(0.2)
						.font(.Bold.regular)
						.foregroundStyle(.primary)
				}
				.padding()
				.frame(height: 80)
				.frame(maxWidth: .infinity)
				.background(
					RoundedRectangle(cornerRadius: 10)
						.fill(.secondary.opacity(0.05))
						.stroke(.secondary, lineWidth: 2)
				)
			}

			TimebookingWeek()
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
