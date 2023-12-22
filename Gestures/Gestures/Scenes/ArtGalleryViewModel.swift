//
//  ArtGalleryViewModel.swift
//  Gestures
//
//  Created by Levan Loladze on 22.12.23.
//

import SwiftUI

// MARK: - ViewModel
final class ArtGalleryViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var currentAmount = 0.0
    @Published var finalAmount = 1.0
    @Published var rotationStart = Angle.zero
    @Published var rotationFinal = Angle.zero
    @Published var offsetSize = CGSize.zero
    @Published var isLongPressActive = false
   
}
