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
    
    var timer : Publishers.Autoconnect<Timer.TimerPublisher>
    
    
    var body: some View {
        if !timerStarts {
            VStack{
                TimerView(timeRemaining: timeRemaining, isVisible: $isVisible, timerStarts: $timerStarts, timer: timer)
                    .font(.largeTitle)
                
                Text("Study Mode")
                    .font(.caption  )
                
            }
        } else {
            VStack{
                BreakTimerView(breakTimeRemaining: breakTimeRemaining, isVisible: $isVisible, timerStarts: $timerStarts, timer: timer)
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
