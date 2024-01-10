//
//  FormatTime.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 9.01.2024.
//

import Foundation

/**
 func formatTime(_ totalSeconds: Int) -> String
 - parameter totalSeconds: The total number of seconds to be formatted.
 - returns: A formatted time string in the format "HH:MM:SS".
 */
func formatTime(_ totalSeconds: Int) -> String {
    let minutes = totalSeconds / 60
    let seconds = totalSeconds % 60
    let hours = minutes / 60
    let remainingMinutes = minutes % 60
    return String(format: "%02d:%02d:%02d", hours, remainingMinutes, seconds)
}
