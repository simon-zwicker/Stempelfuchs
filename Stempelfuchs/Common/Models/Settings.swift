//
//  Settings.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 03.05.25.
//

struct Settings: Codable {
	let name: String
	let federalState: FederalState
	let weekHours: Double
	let workDays: [Days]
	let timeAccount: String
	let isTimeAccountNegative: Bool
}

extension Settings {
	static var empty: Self {
		.init(
			name: "",
			federalState: .bw,
			weekHours: 0.0,
			workDays: [],
			timeAccount: "0",
			isTimeAccountNegative: false
		)
	}
}
