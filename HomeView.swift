//
//  HomeView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/2/25.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    @State private var isStudyModeActive: Bool = false
    @State private var timeRemaining = 1800 // 30 min study session
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack{
            Color.cream.edgesIgnoringSafeArea(.all)
    
            VStack{
            if isStudyModeActive{
                // TimerView using the main timeRemaining for study session.
                TimerView(timeRemaining: timeRemaining, introViewVisible: $isStudyModeActive, timer: timer)
                    
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
