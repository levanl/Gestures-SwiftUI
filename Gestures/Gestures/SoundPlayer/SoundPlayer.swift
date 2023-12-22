//
//  SoundPlayer.swift
//  Gestures
//
//  Created by Levan Loladze on 22.12.23.
//

import SwiftUI
import AVFAudio

final class SoundPlayer {
    var audioPlayer: AVAudioPlayer?
    
    func playSound(withName name: String, fileType: String) {
        if let path = Bundle.main.path(forResource: name, ofType: fileType) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
}
