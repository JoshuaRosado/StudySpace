//
//  HomeView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/2/25.
//
import Combine 
import SwiftData
import SwiftUI


struct HomeView: View {

    // Tracking if StudyMode is active
    @State private var isStudyModeActive: Bool = false
    
    // Tracking if NotesView is displayed
    @State private var showNotesView: Bool = false
    
    @State private var timeRemaining = 1800 // Default 30 min study session
    
    @State private var breakTimeRemaining = 300 // Default 5 min break time
    
    var studyTimeOptions = [7,900,1800,2700,3600] // Study time selection
    var breakTimeOptions = [5,300,600,900] // Break time selection
    
    
    // Timer to be passed in as parameter into MainView where StudyTimer and BreakTimer will be displayed
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            // Background Color ----
            Color.inkWell.edgesIgnoringSafeArea(.all)
            
            // Stack Over the background ----
            VStack{
                
                
                // When StudyMode is Active
                
                if isStudyModeActive{
                    // Display MainTimerView in the center with the exit StudyMode button at the bottom
                    
                    // Passing timeRemaining and breakTimeRemaining selected by user on the Picker
                    Spacer()
                    MainTimerView(timeRemaining: timeRemaining, breakTimeRemaining: breakTimeRemaining, timer: timer)
                        .fontWeight(.black)
                        .foregroundStyle(.auLait)
                    
                    
                    Spacer()
                    // Bottom Stack ----
                    HStack{
                        Spacer()
                        // Exit Study Mode Button deactivating StudyMode Timer
                        Button("Exit Study Mode"){
                            withAnimation{
                                isStudyModeActive.toggle()
                            }
                        }
                        Spacer()
                        
                        // Notes Button that Opnes a NotesView
                        Button("Notes"){
                            showNotesView.toggle()
                        }
                        Spacer()
                    }
                    .foregroundStyle(.roastedPeach)
                    .padding(.bottom, 4)
                    
                    .font(.caption)
                    
                    
                } else {
                    
                    // When Study Mode is NOT active, display StudyMode button only
                    
                    
                    Spacer()
                    
                    // StudyMode Button with animation appears and disappears when tapped.
                    
                    Button("Study Mode"){
                        withAnimation(.easeOut.delay(0.8)){
                            
                            isStudyModeActive.toggle()
                        }
                    }
                    
                    .padding(.horizontal)
                    
                    .studyModeBtnStyle()
                    Spacer()
                    
                    // Bottom Stack ----
                    VStack{
                        // First Picker for StudyTime Timer
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
                            // Second Picker for BreakTime Timer
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
        // When "Notes" Button is tapped it will toggle $showNotesView to open a .sheet displaying NotesView()
        .sheet(isPresented: $showNotesView){
            NotesView()
        }
    }
}

#Preview {
    HomeView()
}
