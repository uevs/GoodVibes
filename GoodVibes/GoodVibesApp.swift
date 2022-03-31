//
//  GoodVibesApp.swift
//  GoodVibes
//
//  Created by leonardo on 31/03/22.
//

import SwiftUI

@main
struct GoodVibesApp: App {
    @StateObject var vibes = Vibes()
    var body: some Scene {
        WindowGroup {
            ContentView().preferredColorScheme(.dark)
                .environmentObject(vibes)
        }
    }
}
