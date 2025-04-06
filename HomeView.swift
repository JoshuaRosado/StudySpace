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

    @State private var scale: CGSize = .zero
    @State private var isStudyModeActive: Bool = false
    @State private var isStudyModeBtnActive: Bool = false
    @State private var timeRemaining = 1800 // 30 min study session
    
    @State private var num : CGFloat = 2

    
    @State private var showNotes = false
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack{
            ZStack{
                Color.inkWell.edgesIgnoringSafeArea(.all)
                
                VStack{
                    // When StudyMode is Active
                    // Display Main Timer with the bottom button to exit StudyMode
                    if isStudyModeActive{
                        // TimerView using the main timeRemaining for study session.
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
                        .fontDesign(.serif)
                        .padding(.bottom, 2)
                    } else {
                        
                        // When Study Mode is NOT active, display Study Mode button only
                        
                        Button("Study Mode"){
                            withAnimation(.easeIn(duration: 0.3)){
                                isStudyModeBtnActive.toggle()
                                num = -2
                                
                            }
                            withAnimation(.easeOut.delay(1.5)){
                                
                                isStudyModeActive.toggle()
                                num = 2
                                
                            }
                        }
                        
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.auLait)
                        .padding()
                        .buttonStyle(.plain)
                        .background(.inkWell)
                        .clipShape(Capsule())
                        .shadow(color:.black.opacity(0.4) , radius: 2 , x: num, y: num)
                        
                        
                        
                        
                    }
                    
                }
            }
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
