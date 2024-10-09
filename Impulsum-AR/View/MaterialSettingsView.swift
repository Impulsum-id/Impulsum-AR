//
//  MaterialSettingsView.swift
//  Impulsum-AR
//
//  Created by Lucky on 08/10/24.
//

import SwiftUI

struct MaterialSettingsView: View {
    
    @Binding var selectedImageName: String?
    
    @State private var selectedButton: Int = 1
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 8) {
                
                if selectedButton == 1 {
                    MaterialView(selectedImageName: $selectedImageName)
                } else if selectedButton == 2 {
                    MaterialView(selectedImageName: $selectedImageName)
                }
                
                VStack(spacing: 15) {
                    CustomCircleButtonView(iconName: "square.on.square.intersection.dashed", isSelected: selectedButton == 1) {
                        selectedButton = 1
                    }
                    
                    CustomCircleButtonView(iconName: "heart.fill", isSelected: selectedButton == 2) {
                        selectedButton = 2
                    }
                }
            }
        }
    }
}

#Preview {
    MaterialSettingsView(selectedImageName: .constant("GrigoTexture"))
}
