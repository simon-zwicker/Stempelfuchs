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
	@State private var menuPoint: MenuPoint = .timer

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
			case .timer: TimebookingView()
            case .overview: MyOverviewView()
            case .calendar: CalendarView()
            case .statistic: StatisticsView()
            }
		}
	}
}

#Preview {
	DashboardScreen()
}
