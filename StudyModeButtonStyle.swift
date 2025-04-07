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
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(Color.auLait)
            .padding()
            .buttonStyle(.plain)
            .background(.inkWell)
            .clipShape(Capsule())
    }
}

extension View {
    func studyModeBtnStyle() -> some View {
        modifier(StudyModeButtonStyle())
    }
}

