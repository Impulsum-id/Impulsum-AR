//
//  TabView.swift
//  Impulsum-AR
//
//  Created by Lucky on 08/10/24.
//

import SwiftUI

struct TabView: View {
    
    @Binding var showSettings: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 78) {
                
                // Back Arrow Button
                Button(action: {
                    print("Back button tapped")
                }) {
                    Image(systemName: "arrow.uturn.backward")
                        .font(.system(size: 32, weight: .medium))
                        .foregroundStyle(.white)
                        .frame(width: 38, height: 34, alignment: .center)
                }
                .disabled(true)
                
                // Shutter Circle Button
                Button(action: {
                    NotificationCenter.default.post(name: .placeModel, object: nil)
                }) {
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 60, height: 60)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 5)
                        )
                }
                
                // Setting Button
                Button(action: {
                    showSettings.toggle()
                }) {
                    Image(systemName: "slider.horizontal.3")
                        .font(.system(size: 32, weight: .medium))
                        .foregroundStyle(.white)
                        .frame(width: 41, height: 17, alignment: .center)
                }
            }
            .padding(.vertical, 34).padding(.horizontal, 49)
            
        }
        .frame(width: UIScreen.main.bounds.width, height: 128)
        .background(Color(red: 0.26, green: 0.26, blue: 0.26).opacity(0.68))
    }
}

#Preview {
    TabView(showSettings: .constant(false))
}
