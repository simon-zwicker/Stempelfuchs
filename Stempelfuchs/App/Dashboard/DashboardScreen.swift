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

				Text("Hallo \(model.setting.name)")
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
		.onAppear {
			print(model.setting)
		}
	}
}

#Preview {
	DashboardScreen()
}
