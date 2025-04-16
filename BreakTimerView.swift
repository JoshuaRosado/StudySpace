//
//  BreakTimerView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/16/25.
//

import SwiftUI
import Combine

struct BreakTimerView: View {
    @State var breakTimeRemaining: Int
    @State var introViewVisible: Binding<Bool>
    @State var breakTimerStarts: Binding<Bool>
    var timer : Publishers.Autoconnect<Timer.TimerPublisher>
    
    var body: some View {
        // Displaying timeRemaining
        Text(breakTimeRemaining, format: .timerCountdown)
            // receiving timer
            .onReceive(timer) { _ in
                // As long "timer" runs and "timeRemaining" is greater than 0
                if breakTimeRemaining > 0 {
                    // subtract 1 from timeRemaining
                    breakTimeRemaining -= 1
                }
                    // when timeRemaining reaches 0
                else if breakTimeRemaining == 0 {
                    withAnimation{
                        // stop timer
                        timer.upstream.connect().cancel()
                        // make introView invisible
                        breakTimerStarts.wrappedValue.toggle()
                        introViewVisible.wrappedValue.toggle()
                    }
                }
            }
    }
}

#Preview {
    BreakTimerView(breakTimeRemaining: 5,introViewVisible: .constant(true), breakTimerStarts: .constant(false), timer: Timer.publish(every: 1, on: .main, in: .common).autoconnect())
}

