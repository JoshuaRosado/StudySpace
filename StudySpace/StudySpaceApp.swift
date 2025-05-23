//
//  StudyWatchApp.swift
//  StudyWatch
//
//  Created by Joshua Rosado Olivencia on 3/30/25.
//

import SwiftData
import SwiftUI


@main
struct StudySpaceApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack{
                Color.wholeWheat.ignoresSafeArea()
                
                ContentView()
            }
        }
        .modelContainer(for: Note.self)
    }
}
