//
//  Calendar.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 06.05.25.
//

import Foundation

extension Calendar {
    static var currentStartMonday: Self {
        var calendar: Self = .current
        calendar.firstWeekday = 2
        return calendar
    }
}
