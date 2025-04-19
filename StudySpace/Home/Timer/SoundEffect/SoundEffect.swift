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
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
            print("Unable to find \(soundFileName) in bundle")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Sound playback error: \(error.localizedDescription)")
        }
        
    }
    
}
