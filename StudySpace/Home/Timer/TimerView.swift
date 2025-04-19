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
    @State var introViewVisible: Binding<Bool>
    @State var breakTimerStarts: Binding<Bool>
    
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
                else if timeRemaining == 10 {
                    timerSoundEffect.toggle()
                }
                else if timeRemaining == 5 {
                    timerSoundEffect.toggle()
                }
                
                    // when timeRemaining reaches 0
                else if timeRemaining == 0 {
                    
                
                    withAnimation{
                        // stop timer
                        timer.upstream.connect().cancel()
                        // make introView invisible
                        introViewVisible.wrappedValue.toggle()
                        
                        breakTimerStarts.wrappedValue.toggle()
                        
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
    TimerView(timeRemaining: 5, introViewVisible: .constant(true), breakTimerStarts: .constant(false), timer: Timer.publish(every: 1, on: .main, in: .common).autoconnect())
}


