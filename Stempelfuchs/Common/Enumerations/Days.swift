//
//  Days.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 03.05.25.
//

enum Days: String, CaseIterable, Identifiable {

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
	static var defaultDays: [Self] {
		[.monday, .tuesday, .wednesday, .thursday, .friday]
	}

	static var weekendDays: [Self] {
		[.saturday, .sunday]
	}
}
