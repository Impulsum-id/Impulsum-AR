//
//  CircularButtonView.swift
//  Impulsum-AR
//
//  Created by Lucky on 08/10/24.
//

import SwiftUI

struct CircularButtonView: View {
    var iconName: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                // Background circle that changes color based on selection
                Circle()
                    .fill(isSelected ? Color.brown : Color.clear) // Change to brown if selected
                    .frame(width: 75, height: 75)
                
                // Overlay with ultraThinMaterial
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: 75, height: 75)

                // Icon
                Image(systemName: iconName)
                    .font(.system(size: 25, weight: .medium))
                    .foregroundColor(.white.opacity(0.96))
            }
        }
        .clipShape(Circle())
    }
}

//#Preview {
//    CircularButtonView(iconName: "square.on.square.intersection.dashed")
//}
