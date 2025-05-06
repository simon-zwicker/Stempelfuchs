//
//  TimeInterval.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 06.05.25.
//

import Foundation

extension TimeInterval {
    static var now: TimeInterval {
        Date.now.timeIntervalSince1970
    }
    
    var hours: Int {
        Int(self) / 3600
    }

    var minutes: Int {
        (Int(self) % 3600) / 60
    }

    var second: Int {
        Int(self) % 60
    }

    var elapsedHoursMinutes: String {
        String(format: "%02d:%02d", hours, minutes)
    }

    var elapsedSeconds: String {
        String(format: "%02d", second)
    }

	var hoursMinutes: String {
		let date = Date(timeIntervalSince1970: self)
		return String(format: "%02d:%02d", date.hour, date.minute)
	}

	var seconds: String {
		let date = Date(timeIntervalSince1970: self)
		return String(format: "%02d", date.second)
	}
}
