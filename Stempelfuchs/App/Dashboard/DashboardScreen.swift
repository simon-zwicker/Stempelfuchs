//
//  DashboardScreen.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 03.05.25.
//

import SwiftUI
import SwiftData

struct DashboardScreen: View {

	// MARK: - Properties

	@State private var model: DashboardModel = .init()
	@State private var menuPoint: MenuPoint = .timer
    @Query(sort: \TimeEntry.startedAt) private var timeEntries: [TimeEntry]
    @State private var todayEntries: [TimeEntry] = []
    @State private var currentEntry: TimeEntry?

	// MARK: - View Body
	var body: some View {
		VStack {
			HStack(spacing: 15) {
				Image(.sfLogo)
					.resizable()
					.scaledToFit()
					.frame(width: 50)

                Text("Hallo \(AppUtils.shared.name)")
					.font(.Bold.heading1)

				Spacer()
			}
			.padding()

			MenuComponent(selected: $menuPoint)

            switch menuPoint {
            case .timer: TimebookingView(currentEntry: $currentEntry)
            case .overview: MyOverviewView()
            case .calendar: CalendarView()
            case .statistic: StatisticsView()
            }
		}
		.environment(\.dashboardModel, model)
        .onChange(of: timeEntries) { _, newValue in
            let today = newValue.filter({ Date(timeIntervalSince1970: $0.startedAt).isToday })
            Array(today.suffix(2)).forEach({
                print("Start: \(Date(timeIntervalSince1970: $0.startedAt)) - End: \(Date(timeIntervalSince1970: $0.endedAt ?? 0)) - Pause: \($0.isPause)")
            })
        }
        .onAppear {
            let today = timeEntries.filter({ Date(timeIntervalSince1970: $0.startedAt).isToday })
            today.forEach({
                print("Start: \(Date(timeIntervalSince1970: $0.startedAt)) - End: \(Date(timeIntervalSince1970: $0.endedAt ?? 0)) - Pause: \($0.isPause)")
            })
        }
	}
}

#Preview {
	DashboardScreen()
}
