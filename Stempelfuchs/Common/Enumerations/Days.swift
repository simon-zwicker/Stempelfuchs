//
//  Days.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 03.05.25.
//

enum Days: String, CaseIterable, Identifiable, Codable {

	var id: Self { self }

	case monday = "Mo"
	case tuesday = "Di"
	case wednesday = "Mi"
	case thursday = "Do"
	case friday = "Fr"
	case saturday = "Sa"
	case sunday = "So"
}

extension Days {
	var name: String {
		switch self {
		case .monday: "Montag"
		case .tuesday: "Dienstag"
		case .wednesday: "Mittwoch"
		case .thursday: "Donnerstag"
		case .friday: "Freitag"
		case .saturday: "Samstag"
		case .sunday: "Sonntag"
		}
	}

	var weekday: Int {
		switch self {
		case .monday: 2
		case .tuesday: 3
		case .wednesday: 4
		case .thursday: 5
		case .friday: 6
		case .saturday: 7
		case .sunday: 1
		}
	}

	static var defaultDays: [Self] {
		[.monday, .tuesday, .wednesday, .thursday, .friday]
	}

	static var weekendDays: [Self] {
		[.saturday, .sunday]
	}
}
