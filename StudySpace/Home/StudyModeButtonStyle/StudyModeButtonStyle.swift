//
//  StudyModeButtonStyle.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/7/25.
//

import SwiftUI

struct StudyModeButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22, weight: .light))
            .foregroundStyle(Color.auLait)
            .fontDesign(.serif)
            .padding()
            .padding(.bottom, 5)
            .buttonStyle(.plain)
            .background(.eucalyptus.opacity(0.03))
            .clipShape(.capsule)
            
    }
}

extension View {
    func studyModeBtnStyle() -> some View {
        modifier(StudyModeButtonStyle())
    }
}

