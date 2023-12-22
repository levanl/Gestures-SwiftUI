//
//  GesturesApp.swift
//  Gestures
//
//  Created by Levan Loladze on 22.12.23.
//

import SwiftUI

@main
struct GesturesApp: App {
    
    @StateObject private var viewModel = ArtGalleryViewModel()
    
    var body: some Scene {
        WindowGroup {
            ArtGalleryScene()
                .environmentObject(viewModel)
        }
    }
}
