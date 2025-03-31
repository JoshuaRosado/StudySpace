//
//  OpeningView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 3/31/25.
//

import SwiftUI

struct OpeningView: View {
    @State private var introViewVisible = true
    @State private var timeRemainig = 5
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text(timeRemainig, format: .number)
            .onReceive(timer) { _ in
                if timeRemainig > 0 {
                    timeRemainig -= 1
                }
                
                else if timeRemainig == 0 {
                    withAnimation{
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
#Preview {
    OpeningView()
}
