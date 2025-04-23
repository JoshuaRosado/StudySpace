//
//  TimerView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/2/25.
//

import SwiftUI
import Combine
import AVFoundation

struct TimerView: View {
    @State var audioPlayer: AVAudioPlayer!
    @State var timeRemaining: Int
    @State private var timerSoundEffect = false
    @State var isVisible: Binding<Bool>
    @State var timerStarts: Binding<Bool>
    @State var soundEffectFileName: String
    
    var timer : Publishers.Autoconnect<Timer.TimerPublisher>
    
    var body: some View {
        // Displaying timeRemaining
        Text(timeRemaining, format: .timerCountdown)
            // receiving timer
            .onReceive(timer) { _ in
                // As long "timer" runs and "timeRemaining" is greater than 0
                
                if timeRemaining > 0 {
                    // subtract 1 from timeRemaining
                    timeRemaining -= 1
                }
                
                else if timeRemaining == 3 {
                    timerSoundEffect = false
                    
                }
                
                
                    // when timeRemaining reaches 0
                else if timeRemaining == 0 {
                    timerSoundEffect = true
                    
                
                    withAnimation{
                        // stop timer
                        timer.upstream.connect().cancel()
                        // make introView invisibl
                        isVisible.wrappedValue.toggle()
                        
                        timerStarts.wrappedValue.toggle()
                        
                    }
                }
                if timerSoundEffect{
                    withAnimation{
                        SoundEffect.playSoundEffect(soundEffectFileName)
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
    TimerView(timeRemaining: 5, isVisible: .constant(true), timerStarts: .constant(false), soundEffectFileName: "bell_break.wav", timer: Timer.publish(every: 1, on: .main, in: .common).autoconnect())
}


