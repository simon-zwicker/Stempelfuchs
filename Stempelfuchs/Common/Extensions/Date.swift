//
//  Date.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 03.05.25.
//

import Foundation

extension Date {
    var weekNumber: Int { Calendar.currentStartMonday.component(.weekOfYear, from: self) }
    var dayNumber: Int { Calendar.currentStartMonday.component(.weekday, from: self) }
    
    var dayNameShort: String {
        let formatter: DateFormatter = .init()
        formatter.locale = .current
        formatter.dateFormat = "EE"
        return formatter.string(from: self)
    }
    
    var dayName: String {
        let formatter: DateFormatter = .init()
        formatter.locale = .current
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }
    
    var daysOfWeek: [Date] {
        let calendar = Calendar.currentStartMonday
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: self) else { return [] }
        return (0..<7).compactMap { offset in
            guard let day = calendar.date(byAdding: .day, value: offset, to: weekInterval.start) else { return nil }
            return day
        }
    }
}
