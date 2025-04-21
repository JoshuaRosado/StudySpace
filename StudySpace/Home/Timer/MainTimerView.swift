//
//  MainTimerView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/16/25.
//

import SwiftUI
import Combine

struct MainTimerView: View {
    // StudyTime --
    @State var timeRemaining: Int
    // isVisible is not used for this View
    @State var isVisible = false
    // BreakTime --
    @State var breakTimeRemaining: Int
    // Tracking when timer Starts
    @State var breakTimerStarts = false
    // Transition from studyTime to breakTime sound effect
    let studyTime = "bell_break.wav"
    // Transition from breakTime to studyTime sound effect
    let breakTime = "studyTimer.wav"
    
    
    var timer : Publishers.Autoconnect<Timer.TimerPublisher>
    
    
    var body: some View {
        // As long breakTime has NOT started
        
        if !breakTimerStarts {
            
            // Display TimerView with StudyTime parameters
            VStack{
                // StudyTime Timer ----
                
                TimerView(timeRemaining: timeRemaining, isVisible: $isVisible, timerStarts: $breakTimerStarts, soundEffectFileName: studyTime, timer: timer)
                    .font(.largeTitle)
                
                Text("Study Mode")
                    .font(.caption  )
                
            }
        } else {
            // If breakTime starts
            VStack{
                // Display TimerView with BreakTime parameters
                
                // BreakTime Timer ----
                
                TimerView(timeRemaining: breakTimeRemaining, isVisible: $isVisible, timerStarts: $breakTimerStarts,soundEffectFileName: breakTime , timer: timer)
                    .font(.largeTitle)
                
                Text("Break Time")
                    .font(.caption)
                
            }
            .fontWeight(.black)
            .foregroundStyle(.auLait)
            
        }
    }
}

#Preview {
    MainTimerView(timeRemaining: 10, isVisible: true, breakTimeRemaining: 5, breakTimerStarts: false, timer: Timer.publish(every: 1, on: .main, in: .common).autoconnect())
}
