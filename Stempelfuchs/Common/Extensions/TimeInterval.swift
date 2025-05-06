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

    var seconds: Int {
        Int(self) % 60
    }

    var hourMinuteString: String {
        String(format: "%02d:%02d", hours, minutes)
    }

    var secondsString: String {
        String(format: "%02d", seconds)
    }
}
