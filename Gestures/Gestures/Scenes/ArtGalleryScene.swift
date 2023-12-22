//
//  ArtGalleryScene.swift
//  Gestures
//
//  Created by Levan Loladze on 22.12.23.
//

import SwiftUI
import AVFAudio

struct ArtGalleryScene: View {
    
    @EnvironmentObject private var viewModel: ArtGalleryViewModel
    
    let soundPlayer = SoundPlayer()
    
    @State private var scale: CGFloat = 1.0
    @State var position: Angle = Angle(degrees: 0)
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20) {
                
                ImageArtView(imageName: "TXEBI")
                    .offset(viewModel.offsetSize)
                    .simultaneousGesture(
                        DragGesture()
                            .onChanged { viewModel.offsetSize = $0.translation }
                    )
                
                ImageArtView(imageName: "Santa")
                    .onTapGesture {
                        soundPlayer.playSound(withName: "santa1", fileType: "mp3")
                    }
                
                ImageArtView(imageName: "E46")
                
                ImageArtView(imageName: "DZAGLI")
                    .scaleEffect(scale)
                    .gesture(MagnificationGesture()
                        .onChanged { scale in
                            self.scale = scale.magnitude
                        }
                    )
                
                ImageArtView(imageName: "CHASER")
                    .rotationEffect(position)
                    .gesture(
                        RotationGesture()
                            .onChanged { angle in
                                position = angle
                            }
                            .onEnded { angle in
                                withAnimation {
                                    position = Angle(degrees: 0)
                                }
                            }
                    )
                
                ImageArtView(imageName: viewModel.isLongPressActive ? "JOZE" : "SILVIA")
                    .onLongPressGesture(minimumDuration: 1) {
                        withAnimation {
                            viewModel.isLongPressActive.toggle()
                        }
                    }
                ImageArtView(imageName: viewModel.isLongPressActive ? "JOZE" : "SILVIA")
                    .onLongPressGesture(minimumDuration: 1) {
                        withAnimation {
                            viewModel.isLongPressActive.toggle()
                        }
                    }
                ImageArtView(imageName: viewModel.isLongPressActive ? "JOZE" : "SILVIA")
                    .onLongPressGesture(minimumDuration: 1) {
                        withAnimation {
                            viewModel.isLongPressActive.toggle()
                        }
                    }
            }
            .padding()
        }
    }
    
}

struct ImageArtView: View {
    
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



#Preview {
    ArtGalleryScene()
        .environmentObject(ArtGalleryViewModel())
}
