//
//  ravi.swift
//  Gestures
//
//  Created by Levan Loladze on 22.12.23.
//

import SwiftUI

struct ravi: View {
    var body: some View {
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
            .onLongPressGesture {
                print("asda")
            }
    }
}

#Preview {
    ravi()
}
