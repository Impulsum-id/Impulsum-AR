//
//  ARView.swift
//  Impulsum-AR
//
//  Created by Dason Tiovino on 04/10/24.
//

import ARKit
import UIKit
import SwiftUI

struct ARViewContainer: UIViewControllerRepresentable {
    
    @Binding var isCoachingActive: Bool
    @Binding var selectedImageName: String?
    
    func updateUIViewController(_ uiViewController: ARViewController, context: Context) {
        if let imageName = selectedImageName {
            uiViewController.texture = uiViewController.loadTextureResource(named: imageName)
        }
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ARViewContainer>) -> ARViewController {
        let viewController = ARViewController()
        viewController.coachingDelegate = context.coordinator
        context.coordinator.viewController = viewController
        return viewController
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, ARCoachingOverlayViewDelegate {
        var parent: ARViewContainer
        weak var viewController: ARViewController?

        init(_ parent: ARViewContainer) {
            self.parent = parent
        }

        func coachingOverlayViewWillActivate(_ coachingOverlayView: ARCoachingOverlayView) {
            parent.isCoachingActive = true // Set the coaching active state
            viewController?.setFocusEntityVisibility(isVisible: false)
        }

        func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
            parent.isCoachingActive = false // Set the coaching inactive state
            viewController?.setFocusEntityVisibility(isVisible: true)
        }
    }
}
