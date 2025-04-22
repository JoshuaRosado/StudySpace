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
    @State var isVisible: Binding<Bool>
    @State var timerStarts: Binding<Bool>
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
                // when timeRemaining gets to 3
                // toggle Bool to false
                else if breakTimeRemaining == 3 {
                    playBreakSound = false
                }
                
                
                    // when timeRemaining reaches 0
                // toggle Bool to true and it will trigger the sound effect method
                else if breakTimeRemaining == 0 {
                    playBreakSound = true
                    
                    
                    withAnimation{
                        
                        // stop timer
                        timer.upstream.connect().cancel()
                        
                        timerStarts.wrappedValue.toggle()
                        isVisible.wrappedValue.toggle()
                    }
                }
                // when bool is true
                // play sound effect
                if playBreakSound{
                    withAnimation{
                        SoundEffect.playSoundEffect("studyTimer.wav")
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
    BreakTimerView(breakTimeRemaining: 5,isVisible: .constant(true), timerStarts: .constant(false), timer: Timer.publish(every: 1, on: .main, in: .common).autoconnect())
}

