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
    @State var isVisible = true
    @State var breakTimeRemaining: Int
    @State var timerStarts = false
    let studyTime = "bell_break.wav"
    let breakTime = "studyTimer.wav"
    
    var timer : Publishers.Autoconnect<Timer.TimerPublisher>
    
    
    var body: some View {
        if !timerStarts {
            VStack{
                TimerView(timeRemaining: timeRemaining, isVisible: $isVisible, timerStarts: $timerStarts, soundEffectFileName: studyTime, timer: timer)
                    .font(.largeTitle)
                
                Text("Study Mode")
                    .font(.caption  )
                
            }
        } else {
            VStack{
                TimerView(timeRemaining: breakTimeRemaining, isVisible: $isVisible, timerStarts: $timerStarts,soundEffectFileName: breakTime , timer: timer)
                    .font(.largeTitle)

                Text("Break time")
                    .font(.caption)
                    
            }
            .fontWeight(.black)
            .foregroundStyle(.auLait)
            
        }
        
    }
    
    
}

#Preview {
    MainTimerView(timeRemaining: 10, isVisible: true, breakTimeRemaining: 5, timerStarts: false, timer: Timer.publish(every: 1, on: .main, in: .common).autoconnect())
}
