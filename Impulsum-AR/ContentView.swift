//
//  ContentView.swift
//  Impulsum-AR
//
//  Created by Rizki Maulana on 03/10/24.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    
    @State private var isCoachingActive: Bool = true
    
    @State private var showSettings = false
    
    @State private var selectedImageName: String? = nil

    var body: some View {
        ZStack {
            ARViewContainer(isCoachingActive: $isCoachingActive, selectedImageName: $selectedImageName)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if showSettings {
                    MaterialSettingsView(selectedImageName: $selectedImageName)
                }
                
                Spacer()
                
                if !isCoachingActive {
                    TabView(showSettings: $showSettings)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
