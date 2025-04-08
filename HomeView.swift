//
//  HomeView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/2/25.
//

import SwiftData
import SwiftUI
import Combine

struct HomeView: View {
    @State private var isStudyModeActive: Bool = false
    @State private var timeRemaining = 1800 // 30 min study session
    @State private var scale : CGFloat = 1

    var shadowInt: CGFloat = 4
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.inkWell.edgesIgnoringSafeArea(.all)
                
                VStack{
                    // When StudyMode is Active
                    // Display Main Timer in the center with the exit StudyMode button at the bottom
                    if isStudyModeActive{
                        // Using TimerView with timeRemaining for study session.
                        Spacer()
                        TimerView(timeRemaining: timeRemaining, introViewVisible: $isStudyModeActive, timer: timer)
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundStyle(.auLait)
                        
                        
                        Spacer()
                        
                        Button("Exit Study Mode"){
                            withAnimation{
                                isStudyModeActive.toggle()
                            }
                        }
                        .foregroundStyle(.roastedPeach)
                        .padding(.bottom, 4)
                        .font(.caption)
                    } else {
                        
                        // When Study Mode is NOT active, display Study Mode button only
                        
                            Button("Study Mode"){
                                
                                
                                withAnimation(.linear(duration:1)){
//
                                    scale = 0
                                    
                                    
                                }
                                withAnimation(.easeOut.delay(0.8)){
                                    
                                    isStudyModeActive.toggle()
                                        scale = 1

                            }
                        }
                        
                            .padding(.horizontal)
                        .studyModeBtnStyle()
                        
                    }
                }
            }
            // Toolbar with NavigationLink "Notes" to display NotesView()
            .toolbar{
                HStack{
                    NavigationLink("Notes"){
                        NotesView()
                    }
                    .foregroundStyle(.roastedPeach)
                }
            }
        }
    }
    
}


#Preview {
    HomeView()
}
