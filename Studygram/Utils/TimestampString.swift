//
//  TimestampString.swift
//  Studygram
//
//  Created by Renzo Alvaroshan on 26/07/22.
//

import Foundation

class TimestampString {
    static func timestampString(dateValue: Date) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: dateValue, to: Date()) ?? ""
    }
}


