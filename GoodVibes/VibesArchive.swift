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
    @Published var vibe = ["Message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec finibus, nisi at vehicula dictum, nunc nunc sollicitudin orci, eget ullamcorper nibh purus id ipsum.", "Name": "Anon"]
    


    init() {

    }
    
    func getVibe() {
  
        if color == "Pink" {
            color = "Blue"
        } else if color == "Blue" {
            color = "Pink"
        }
        
        if flip == Angle(degrees: 0.0) {
            withAnimation {
                flip = Angle(degrees: 180.0)
            }
        } else {
            withAnimation {
                flip = Angle(degrees: 0.0)
                
            }
        }
    }
}
