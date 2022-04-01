//
//  VibeArchive.swift
//  GoodVibes
//
//  Created by leonardo on 31/03/22.
//

import Foundation
import SwiftUI


class Vibes: ObservableObject {
    @Published var sending: Bool = false
    @Published var stopAnimation: Bool = false
    @Published var hideVibe: Bool = false
    @Published var color: String = "Pink"
    @Published var flip: Angle = Angle(degrees: 0.0)
    @Published var panX: CGFloat = 5
    @Published var panY: CGFloat = 0
    var previousState: (CGFloat, CGFloat) = (5,5)
    

    
    @Published var vibe = ["Message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec finibus, nisi at vehicula dictum, nunc nunc sollicitudin orci, eget ullamcorper nibh purus id ipsum.", "Name": "Anonymous"]
    
    var vibes = [["Message": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec finibus, nisi at vehicula dictum, nunc nunc sollicitudin orci, eget ullamcorper nibh purus id ipsum.", "Name": "Anonymous"],["Message": "Ut tempus felis nisi. Etiam tortor nisl, rhoncus in rutrum vitae, semper condimentum ligula. Donec eget dapibus erat. Nam bibendum et arcu sodales venenatis. Aliquam vel risus urna. Suspendisse potenti. Phasellus a facilisis justo. Maecenas eu orci dui.", "Name": "Anon"]]
    
    init() {

    }
    
    func getVibe() {
        panX.negate()
        previousState.0 = panX
        
        var newVibe = vibes[Int.random(in: 0..<vibes.count)]
        while newVibe["Name"] == vibe["Name"] {
            newVibe = vibes[Int.random(in: 0..<vibes.count)]
        }
        withAnimation {
            vibe = newVibe
            
        }
        
        color = color == "Pink" ? "Blue" : "Pink"
        
        withAnimation {
            flip = flip == Angle(degrees: 0.0) ? Angle(degrees: 180.0) : Angle(degrees: 0.0)
            
        }
        
    }
    
    func reset() {
        color = color == "Pink" ? "Blue" : "Pink"
        sending = false
        withAnimation {
            panY = 0
            previousState.0.negate()
            panX = previousState.0
            hideVibe = false
        }
        stopAnimation = false

    }
    
    func sendVibe() {
        sending = true
        stopAnimation = true
        hideVibe = true
        panX = 0
        previousState.1.negate()
        panY = previousState.1
        color = color == "Pink" ? "Blue" : "Pink"
    }
}
