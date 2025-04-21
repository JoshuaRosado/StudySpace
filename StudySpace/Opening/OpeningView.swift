//
//  OpeningView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 3/31/25.
//

import SwiftUI

struct OpeningView: View {
    // tracking the intro View
    // When app opens, the introView is visible ( true )
    @State private var isVisible = true
    
    // timerStart is not used in this Vieww
    @State private var timerStart = false
    
    // Duration time for the introView
    @State private var timeRemaining = 3
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        ZStack{
            // Timer for intro view. Empty soundEffectFileName, not needed in this view.
            TimerView(timeRemaining: timeRemaining, isVisible: $isVisible,timerStarts: $timerStart, soundEffectFileName: "", timer: timer)
            // Hide the timeRemaining( We do not need it visible )
                .opacity(0)
            
            // Display introView when Bool ==  true
            // When app opens "isVisible" is true and it will display the IntroView() for 3 seconds
            if isVisible {
                IntroView()
                // After 3 seconds of IntroView display, "isVisible" will become false
            } else {
                // Display HomeView when Bool == false
                HomeView()
            }
        }
    }
}
#Preview {
    OpeningView()
}
