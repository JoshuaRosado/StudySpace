//
//  BreakTimerView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/16/25.
//

import SwiftUI
import Combine
import AVFoundation

struct BreakTimerView: View {
    @State var audioPlayer: AVAudioPlayer!
    @State private var playBreakSound = false
    @State var breakTimeRemaining: Int
    @State var introViewVisible: Binding<Bool>
    @State var breakTimerStarts: Binding<Bool>
    var timer : Publishers.Autoconnect<Timer.TimerPublisher>
    
    var body: some View {
        // Displaying timeRemaining
        Text(breakTimeRemaining, format: .timerCountdown)
            // receiving timer
            .onReceive(timer) { _ in
                // As long "timer" runs and "timeRemaining" is greater than 0
                if breakTimeRemaining > 0 {
                    // subtract 1 from timeRemaining
                    breakTimeRemaining -= 1
                }
                else if breakTimeRemaining > 3 {
                    playBreakSound = false
                }
                
                    // when timeRemaining reaches 0
                else if breakTimeRemaining == 0 {
                    playBreakSound.toggle()
                    
                    withAnimation{
                        
                        // stop timer
                        timer.upstream.connect().cancel()
                        // make introView invisible
                        breakTimerStarts.wrappedValue.toggle()
                        introViewVisible.wrappedValue.toggle()
                    }
                }
                if playBreakSound{
                    withAnimation(.easeInOut(duration: 5)){
                        playSoundEffect("bell_break.wav")
                    }
                }
            }
    }
    func playSoundEffect(_ soundFileName: String) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
            fatalError("Unable to find \(soundFileName) in bundle")
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer.play()
        } catch {
            print(error.localizedDescription)
        }
        
    }
}

#Preview {
    BreakTimerView(breakTimeRemaining: 5,introViewVisible: .constant(true), breakTimerStarts: .constant(false), timer: Timer.publish(every: 1, on: .main, in: .common).autoconnect())
}

