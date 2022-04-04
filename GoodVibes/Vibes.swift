//
//  VibeArchive.swift
//  GoodVibes
//
//  Created by leonardo on 31/03/22.
//

import Foundation
import SwiftUI


struct Vibe: Codable {
    var id:  UUID
    var message: String
    var from: String
}


class Vibes: ObservableObject {

    
    // States
    @Published var sending: Bool = false
    @Published var stopAnimation: Bool = false
    @Published var hideVibe: Bool = false
    @Published var color: String = "Pink"
    
    // Animations
    @Published var flip: Angle = Angle(degrees: 0.0)
    @Published var panX: CGFloat = 5
    @Published var panY: CGFloat = 0
    var previousState: (CGFloat, CGFloat) = (5,5)
    
    // Data
    var vibesDB: [Vibe] = [Vibe(id: UUID(), message: "Heeeeeey", from: "Antonio D'Amore"), Vibe(id: UUID(), message: "You can't teach new tricks to an old dog.", from: "J.J. Ventre")]
    var currentVibe: Vibe = Vibe(id: UUID(), message: "You can't teach new tricks to an old dog.", from: "J.J. Ventre")
    
    
    init() {
   
        let decoder = JSONDecoder()
        
        do {
            if UserDefaults.standard.data(forKey: "vibes") != nil {
                self.vibesDB = try decoder.decode([Vibe].self, from: UserDefaults.standard.data(forKey: "vibes")!)
            }
            
        } catch {
            print(error)
        }

    }
    
    
    func getVibe() {

        var newVibe = vibesDB[Int.random(in: 0..<vibesDB.count)]
        
        while newVibe.id == currentVibe.id {
            let num = Int.random(in: 0..<vibesDB.count)
            newVibe = vibesDB[num]
        }
        
        color = color == "Pink" ? "Blue" : "Pink"
        panX.negate()
        previousState.0 = panX
        
        withAnimation {
            currentVibe = newVibe
        }
        withAnimation {
            flip = flip == Angle(degrees: 0.0) ? Angle(degrees: 180.0) : Angle(degrees: 0.0)
        }
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
    
    func resetAnimations() {
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
    
    func updateVibes() async {
        print("Updating the Vibes")
        
        if let lastUpdate = UserDefaults.standard.object(forKey: "lastUpdate") as? Date {
            print("Last Update was \(lastUpdate), now is \(Date())")
            
            if let difference = Calendar.current.dateComponents([.minute], from: lastUpdate, to: Date()).minute, difference < 5 {
                print("Only \(difference) minutes have been passing, not updating.")
                return
            }
        }
        print("Enough time has passed, continuing.")
                
        //check interval here
        let decoder = JSONDecoder()
        var urlComponents = URLComponents(string: "http://127.0.0.1")!
        urlComponents.port = 8080
        urlComponents.path = "/vibes/all"
        
        do {
            
            let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { print("Bad response"); return}
            
            UserDefaults.standard.set(data, forKey: "vibes")
            UserDefaults.standard.set(Date(), forKey: "lastUpdate")
            
            if let vibes = try? decoder.decode([Vibe].self, from: data) {
                vibesDB = vibes
            } else {
                print("can't decode")
            }
            
        } catch {
            print("Error")
            return
        }
        
    
    }
    
    func uploadVibe(_ contents: [String: String])  {
        print(contents)
    }
    
}
