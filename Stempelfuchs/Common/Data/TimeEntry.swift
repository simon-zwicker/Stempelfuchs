//
//  TimeEntry.swift
//  Stempelfuchs
//
//  Created by Simon Zwicker on 06.05.25.
//

import SwiftData
import Foundation

@Model
final class TimeEntry {
    var startedAt: TimeInterval
    var endedAt: TimeInterval?
    var isPause: Bool
    
    init(date: Date, isPause: Bool = false) {
        self.startedAt = date.timeIntervalSince1970
        self.endedAt = nil
        self.isPause = isPause
    }
}
