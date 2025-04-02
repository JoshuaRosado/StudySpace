//
//  HomeView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/2/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isStudyModeActive: Bool = false
    @State private var timeRemaining = 1800
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack{
            Color.cream.edgesIgnoringSafeArea(.all)
    
            VStack{
            if isStudyModeActive{
                // Displaying timeRemaining
                Text(timeRemaining, format: .number)
                    // receiving timer
                    .onReceive(timer) { _ in
                        // As long "timer" runs and "timeRemaining" is greater than 0
                        if timeRemaining > 0 {
                            // subtract 1 from timeRemaining
                            timeRemaining -= 1
                        }
                            // when timeRemaining reaches 0
                        else if timeRemaining == 0 {
                            withAnimation{
                                // stop timer
                                timer.upstream.connect().cancel()
                                // make introView invisible
                                isStudyModeActive = false
                            }
                        }
                    }
                // Hide the timeRemaining( We do not need it visible )
                    .opacity(0)
                
                
                
                    
                    Text(timeRemaining, format: .timerCountdown)
                }
                Button(isStudyModeActive ? "Exit Study Mode" :"Study Mode"){
                    withAnimation{

                        isStudyModeActive.toggle()
                    }
                    
                    
                
                }
                }
            }
        }
    }


#Preview {
    HomeView()
}
