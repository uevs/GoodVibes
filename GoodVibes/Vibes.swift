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

struct VibesDB: Codable {
    var allVibes: [Vibe]
}


class Vibes: ObservableObject {

    var vibesDB: [Vibe]
    
    
    @Published var sending: Bool = false
    @Published var stopAnimation: Bool = false
    @Published var hideVibe: Bool = false
    @Published var color: String = "Pink"
    @Published var flip: Angle = Angle(degrees: 0.0)
    @Published var panX: CGFloat = 5
    @Published var panY: CGFloat = 0
    var previousState: (CGFloat, CGFloat) = (5,5)
    
    
    
    @Published var vibe: Vibe = Vibe(id: UUID(), message: "Heeeeeey", from: "Antonio D'Amore")
        

    
    init() {
   
        let decoder = JSONDecoder()
        let encoder = JSONEncoder()
        

        
        do {
            if UserDefaults.standard.data(forKey: "vibes") == nil {
                let defaultArray = try encoder.encode([Vibe(id: UUID(), message: "Heeeeeey", from: "Antonio D'Amore")])
                UserDefaults.standard.set(defaultArray, forKey: "vibes")
            }
            
            self.vibesDB = try decoder.decode([Vibe].self, from: UserDefaults.standard.data(forKey: "vibes")!)

        } catch {
            self.vibesDB = [Vibe(id: UUID(), message: "Heeeeeey", from: "Antonio D'Amore")]
            print(error)
        }
        

    }
    
    func start() -> [Vibe] {
        return [Vibe(id: UUID(), message: "Heeeeeey", from: "Antonio D'Amore")]
    }
    
    func getVibe() async {
        panX.negate()
        previousState.0 = panX
        
        var newVibe = vibesDB[Int.random(in: 0..<vibesDB.count)]

        
        while newVibe.id == vibe.id {
            newVibe = vibesDB[Int.random(in: 0..<vibesDB.count)]
        }
        
        withAnimation {
            vibe = newVibe
            
        }
        
        color = color == "Pink" ? "Blue" : "Pink"
        
        withAnimation {
            flip = flip == Angle(degrees: 0.0) ? Angle(degrees: 180.0) : Angle(degrees: 0.0)
            
        }
        await updateVibes()
        // check time
        // update vibes
        
    }
    
    func updateVibes() async {
        
        let decoder = JSONDecoder()
        var urlComponents = URLComponents(string: "http://127.0.0.1")!
        
        
        urlComponents.port = 8080
        urlComponents.path = "/vibes/all"
        
        do {
            
            let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { print("Bad response"); return}
            

            if let vibes = try? decoder.decode([Vibe].self, from: data) {
                print(vibes)
                
                UserDefaults.standard.set(data, forKey: "vibes")
                vibesDB = vibes

            } else {
                print("can't decode")
            }
            
        } catch {
            print(error)
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
