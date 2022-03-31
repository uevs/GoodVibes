//
//  VibeArchive.swift
//  GoodVibes
//
//  Created by leonardo on 31/03/22.
//

import Foundation
import SwiftUI


class Vibes: ObservableObject {
    @Published var color: String = "Pink"
    @Published var flip: Angle = Angle(degrees: 0.0)
    @Published var panX: CGFloat = 5
    @Published var panY: CGFloat = 0
    
    @Published var vibe = ["Message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec finibus, nisi at vehicula dictum, nunc nunc sollicitudin orci, eget ullamcorper nibh purus id ipsum.", "Name": "Anon"]


    init() {

    }
    
    func getVibe() {
        
        color = color == "Pink" ? "Blue" : "Pink"
        
        withAnimation {
            flip = flip == Angle(degrees: 0.0) ? Angle(degrees: 180.0) : Angle(degrees: 0.0)
            
        }
        
    }
    
    func sendVibe() {
        
//        let viewcontroller = storyboard.instantiateViewController(identifier: "vc")
//        let action = UIAction { _ in
//            if let sheet = viewcontroller.sheetPresentationController {
//                sheet.detents = [.medium(), .large()]
//            }
//            
//
//            button.window?.rootViewController?.present(viewcontroller, animated: true)
//            
//            isShowing.toggle()
//        }
        
    }
}
