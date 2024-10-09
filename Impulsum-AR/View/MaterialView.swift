//
//  MaterialView.swift
//  Impulsum-AR
//
//  Created by Lucky on 08/10/24.
//

import SwiftUI

struct MaterialView: View {
    
    @Binding var selectedImageName: String?
    
    @State var selection = 0
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    let images = ["BlackTexture", "GrigoTexture", "PerlaTexture"]
    
    var body: some View {
        VStack(spacing: 5.13) { 
            HStack(spacing: 0) {                        
                Text("Material Selection")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .medium))
                
                Button(action: {
                    // Add your action here
                    print("Button tapped")
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.white.opacity(0.96))
                        .frame(width: 28.21739, height: 28.21739, alignment: .center)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
            }
            
            Picker(selection: $selection, label: Text("test")) {
                Text("Material").tag(0)
                Text("Size").tag(1)
                Text("Pattern").tag(2)
            }
            .pickerStyle(.segmented)
            .colorMultiply(.gray)
            
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 18) {
                    ForEach(0..<images.count, id: \.self) { index in
                        Button(action: {
                            selectedImageName = images[index] 
                        }) {
                            Image(images[index])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 71, height: 71)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10.2)
                                        .inset(by: 1.5)
                                        .stroke(Color.white, lineWidth: 3)
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.vertical, 5)
            
            
        }
        .padding(.horizontal, 15.4)
        .padding(.vertical, 12.8)
        .frame(width: 280, height: 299)
        .background(BlurView(style: .systemUltraThinMaterial))
        .clipShape(RoundedRectangle(cornerRadius: 29.5))
        .overlay(
            RoundedRectangle(cornerRadius: 29.5)
                .inset(by: 0.45)
                .stroke(.white.opacity(0.4), lineWidth: 0.89783)
        )
    }
}

#Preview {
    MaterialView(selectedImageName: .constant("GrigoTexture"))
}
