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
    @State private var isViewVisible = true
    // time for the introView to last
    @State private var timeRemaining = 5
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        ZStack{
            
            TimerView(timeRemaining: timeRemaining, introViewVisible: $isViewVisible, timer: timer)
            // Hide the timeRemaining( We do not need it visible )
                .opacity(0)
            
            // Display introView when Bool ==  true
            if isViewVisible {
                IntroView()
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
