//
//  IntroView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 3/31/25.
//

import SwiftUI

struct IntroView: View {
    @State private var onAppear = false
    var body: some View {
        ZStack{
            Color("eucalyptus")
                .ignoresSafeArea()
            VStack(spacing: 10){
                Text("Welcome to")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.wholeWheat).opacity(0.8)
                    
                Text("Study Space")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .fontDesign(.default)
                    .foregroundStyle(.wholeWheat)
                HStack{
                    Image(systemName: "macbook")
                        .font(.largeTitle)
                    Image(systemName: "timer")
                        .font(.largeTitle)
                }
                
                
            }
        }
        
        
    }
}

#Preview {
    IntroView()
}
