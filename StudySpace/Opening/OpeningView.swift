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
    @State private var introViewVisible = true
    // time for the introView to last
    @State private var timeRemainig = 5
    
    // countdown timer
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Text(timeRemainig, format: .number)
                .onReceive(timer) { _ in
                    if timeRemainig > 0 {
                        timeRemainig -= 1
                    }
                    
                    else if timeRemainig == 0 {
                        withAnimation{
                            timer.upstream.connect().cancel()
                            introViewVisible = false
                        }
                    }
                }
                .opacity(0)
            
            
            if introViewVisible {
                IntroView()
            } else {
                //            homeView()
            }
        }
    }
}
#Preview {
    OpeningView()
}
