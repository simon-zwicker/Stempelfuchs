//
//  MenuPoint.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 04.05.25.
//

import SwiftUI

enum MenuPoint: CaseIterable, Identifiable {

	var id: Self { self }

	case timer
	case overview
	case calendar
	case statistic
}

extension MenuPoint {
	var name: String {
		switch self {
		case .timer: "Zeit buchen"
		case .overview: "Übersicht"
		case .calendar: "Kalender"
		case .statistic: "Statistik"
		}
	}

	var icon: String {
		switch self {
		case .timer: "clock"
		case .overview: "list.bullet"
		case .calendar: "calendar"
		case .statistic: "chart.bar.fill"
		}
	}

	var color: Color {
//		switch self {
//		case .timer: .green
//		case .overview: .blue
//		case .calendar: .pink
//		case .statistic: .purple
//		}
		.main
	}
}
