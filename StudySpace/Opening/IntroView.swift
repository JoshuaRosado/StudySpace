//
//  IntroView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 3/31/25.
//

import SwiftUI

struct IntroView: View {
    
    // tracking when the view appears
    @State private var onAppear = false
    var body: some View {
        ZStack{
            // Background Color----
            Color("lunarEclipse")
                .ignoresSafeArea()
            // Stack in front of Background----
            VStack(spacing: 10){
                // Intro Message----
                Text("Welcome to")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.auLait).opacity(0.8)
                
                Text("Study Space")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .fontDesign(.serif)
                    .foregroundStyle(.cremeBrulee).brightness(0.1)
                HStack{
                    // Intro Message's Logo----
                    Image(systemName: "macbook")
                        .font(.largeTitle)
                    Image(systemName: "timer")
                        .font(.largeTitle)
                }
                .foregroundStyle(.auLait) 
            }
        }
        // Animation effects when Intro View appears and disappears
        .scaleEffect(onAppear ? 1: 1.5)
        .opacity(onAppear ? 1.0: 0.0)
        .onAppear{
            withAnimation(.easeOut(duration: 1.0)){
                onAppear = true
            }
        }
    }
}

#Preview {
    IntroView()
}
