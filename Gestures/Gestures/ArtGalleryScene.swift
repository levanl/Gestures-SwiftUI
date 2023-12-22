//
//  ArtGalleryScene.swift
//  Gestures
//
//  Created by Levan Loladze on 22.12.23.
//

import SwiftUI
import AVFAudio

struct ArtGalleryScene: View {
    
    let soundPlayer = SoundPlayer()
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    @State private var rotationStart = Angle.zero
    @State private var rotationFinal = Angle.zero
    
    @State private var offsetSize = CGSize.zero
    @State private var isLongPressActive = false
    @State var cars: [String] = ["SILVIA", "DZAGLI", "E46", "S15", "CHASER"]
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20){
                
                Image("Santa")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 120)
                    .clipped()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(5)
                    .onTapGesture {
                        soundPlayer.playSound(withName: "santa1", fileType: "mp3")
                    }
                
                Image(isLongPressActive ? "DZAGLI" : "SILVIA")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 120)
                    .clipped()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(5)
                    .onLongPressGesture {
                        withAnimation {
                            isLongPressActive.toggle()
                        }
                    }
                
                Image("DZAGLI")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 120)
                    .clipped()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(5)
                    .scaleEffect(finalAmount + currentAmount)
                    .gesture(
                        MagnificationGesture()
                            .onChanged{ amount in
                                currentAmount = amount - 1
                            }
                            .onEnded{ amount in
                                finalAmount += currentAmount
                                currentAmount = 0
                            }
                    )
                
                Image("E46")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 120)
                    .clipped()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(5)
                    .offset(offsetSize)
                    .gesture(
                        DragGesture()
                            .onChanged { offsetSize = $0.translation }
                    )
                
                Image("CHASER")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 120)
                    .clipped()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(5)
//                    .offset(offsetSize)
                    .rotationEffect(rotationStart + rotationFinal)
                    .gesture(
                        RotationGesture()
                            .onChanged { angle in
                                rotationStart = angle
                            }
                            .onEnded { angle in
                                rotationFinal += rotationStart
                                rotationStart = .zero
                            }
                    )
                
                
            }
            .padding()
        }
    }
    
}


#Preview {
    ArtGalleryScene()
}


struct ImageView: View {
    
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 120)
            .clipped()
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(5)
    }
}


class SoundPlayer {
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
