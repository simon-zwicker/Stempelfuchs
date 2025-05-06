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
    
    init(isPause: Bool = false) {
        self.startedAt = .now
        self.endedAt = nil
        self.isPause = isPause
    }
}
