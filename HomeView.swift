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
    
    @State private var breakTimeRemaining = 300
    
    var studyTimeOptions = [5,900,1800,2700,3600]
    @State private var selectedStudyTime = 1800
    var breakTimeOptions = [3,300,600,900]
    @State private var selectedBreakTime = 300
    
    @State private var showNotesView: Bool = false
    @State private var scale : CGFloat = 1

    var shadowInt: CGFloat = 4
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
            ZStack{
                Color.inkWell.edgesIgnoringSafeArea(.all)
                
                VStack{
                    // When StudyMode is Active
                    // Display Main Timer in the center with the exit StudyMode button at the bottom
                    if isStudyModeActive{
                        // Using TimerView with timeRemaining for study session.
                        Spacer()
                        MainTimerView(timeRemaining: timeRemaining, breakTimeRemaining: breakTimeRemaining, timer: timer)
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundStyle(.auLait)
                        
                        
                        Spacer()
                        HStack{
                            Spacer() 
                            Button("Exit Study Mode"){
                                withAnimation{
                                    isStudyModeActive.toggle()
                                }
                            }
                            Spacer()
                            
                            
                            Button("Notes"){
                                showNotesView.toggle()
                            }
                            Spacer()
                        }
                        .foregroundStyle(.roastedPeach)
                        .padding(.bottom, 4)
                        
                        .font(.caption)
                    } else {
                        
                        
                        
                        // When Study Mode is NOT active, display Study Mode button only
                        Spacer()
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
                        Spacer()
                        VStack{
                            HStack{
                                Text("Study Time")
                                Picker("Study time", selection: $timeRemaining){
                                    ForEach(studyTimeOptions, id: \.self){
                                        Text($0, format: .timeSelection)
                                    }
                                }
                                .pickerStyle(.menu)
                                .tint(Color.wholeWheat)
                            }
                            
                            HStack{
                                Text("Break Time")
                                Picker("Break Time", selection: $breakTimeRemaining){
                                    ForEach(breakTimeOptions, id: \.self){
                                        Text($0, format: .timeSelection)
                                    }
                                }
                                .tint(Color.wholeWheat)
                                
                            }
                        }
                        .padding(.top, -120)
                         
                        
                        
                    }

                }
            }
            .foregroundStyle(.wholeWheat)
            .sheet(isPresented: $showNotesView){
                NotesView()
            }
        }
    }
    



#Preview {
    HomeView()
}
