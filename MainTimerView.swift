//
//  MainTimerView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/16/25.
//

import SwiftUI
import Combine

struct MainTimerView: View {
    
    @State var timeRemaining: Int
    @State var introViewVisible = true
    @State var breakTimeRemaining: Int
    @State var breakTimerStarts = false
    var timer : Publishers.Autoconnect<Timer.TimerPublisher>
    
    
    var body: some View {
        if !breakTimerStarts {
        TimerView(timeRemaining: timeRemaining, introViewVisible: $introViewVisible, breakTimerStarts: $breakTimerStarts, timer: timer)
        } else {
            BreakTimerView(breakTimeRemaining: breakTimeRemaining, introViewVisible: $introViewVisible, breakTimerStarts: $breakTimerStarts, timer: timer)
        }
    }
}

#Preview {
    MainTimerView(timeRemaining: 10, introViewVisible: true, breakTimeRemaining: 5, breakTimerStarts: false, timer: Timer.publish(every: 1, on: .main, in: .common).autoconnect())
}
