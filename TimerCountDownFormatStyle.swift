//
//  TimerCountDownFormatStyle.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/2/25.
//

import Foundation
import SwiftUI

struct TimerCountDownFormatStyle : FormatStyle {
    func format (_ value: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: TimeInterval(value)) ?? ""
    }
}

extension FormatStyle where Self == TimerCountDownFormatStyle {
    static var timerCountdown : TimerCountDownFormatStyle { TimerCountDownFormatStyle()}
}
