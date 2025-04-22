//
//  SoundEffect.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/19/25.
//

import Foundation
import AVFoundation

class SoundEffect{
    static var audioPlayer: AVAudioPlayer?
    
    static func playSoundEffect(_ soundFileName: String) {
        // Find soundFileName in main Bundle
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
            // If not existing, print the following
            print("Unable to find \(soundFileName) in bundle")
            return
        }
        
        do {
            // Try using soundURL in audioPlayer
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            // Play audioPlayer
            audioPlayer?.play()
        } catch {
            // print any errors
            print("Sound playback error: \(error.localizedDescription)")
        }
        
    }
    
}
