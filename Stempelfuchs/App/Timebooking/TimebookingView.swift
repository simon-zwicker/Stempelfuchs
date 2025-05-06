//
//  TimebookingVIew.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 04.05.25.
//

import SwiftUI

struct TimebookingView: View {

	// MARK: - Properties
	@Environment(\.dashboardModel) private var dashboardModel
	@State private var model: WeekInfoModel = .init()

	// MARK: - View Body
	var body: some View {
		VStack {
			TimerComponent()

			VStack(alignment: .leading) {
				Text("Mai 2025")
					.font(.Bold.title2)
					.foregroundStyle(.main)
				Text("KW\(model.weekNumber)")
					.font(.Bold.regular)
					.foregroundStyle(.secondary)

				HStack(spacing: 5) {
					ForEach(model.daysOfCurrentWeek, id: \.date) { day in
						VStack {
							VStack(spacing: 25) {
								Text("\(day.date.day)")
									.font(.Bold.regularSmall)

								Text(day.label.dropLast())
									.font(.Bold.verySmall)
							}
							.padding(.vertical, 10)
							.frame(maxWidth: .infinity)
							.background(
								RoundedRectangle(cornerRadius: 10)
									.fill(weekdayColor(day))
							)

							if day.date.isToday {
								Image(systemName: "arrowtriangle.up.fill")
									.font(.Regular.small)
									.foregroundStyle(.main)
									.padding(.top, 3)
							}
						}
					}
				}
			}
			.padding(.top, 40)

			Spacer()
		}
		.padding(.top, 20)
		.padding()
	}

	func weekdayColor(_ day: (date: Date, label: String)) -> Color {
		guard let workday = Days(rawValue: "\(day.label.dropLast())") else { return .gray }
		if dashboardModel.setting.workDays.contains(workday) {
			return .main.opacity(0.3)
		} else {
			return .secondary.opacity(0.15)
		}
	}
}

#Preview {
	TimebookingView()
}

@Observable
class WeekInfoModel {
	private let calendar: Calendar
	private let formatter: DateFormatter

	init() {
		var cal = Calendar(identifier: .iso8601)
		cal.firstWeekday = 2 // Monday
		cal.minimumDaysInFirstWeek = 4
		self.calendar = cal

		self.formatter = DateFormatter()
		formatter.locale = Locale(identifier: "de_DE")
		formatter.dateFormat = "E" // e.g., Mo 28.04.
	}

	var today: Date = Date()

	var weekNumber: Int {
		calendar.component(.weekOfYear, from: today)
	}

	var daysOfCurrentWeek: [(date: Date, label: String)] {
		guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: today) else {
			return []
		}

		return (0..<7).compactMap { offset in
			if let day = calendar.date(byAdding: .day, value: offset, to: weekInterval.start) {
				return (day, formatter.string(from: day))
			}
			return nil
		}
	}
}
