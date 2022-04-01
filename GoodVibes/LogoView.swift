//
//  LogoView.swift
//  GoodVibes
//
//  Created by leonardo on 31/03/22.
//

import SwiftUI

struct LogoView: View {
    @EnvironmentObject var vibes: Vibes

    
    @State var pan: CGFloat = 5
    
    var body: some View {
        Text("G O O D\nV I B E S")
            .font(.system(size: 80)).bold()
            .foregroundColor(Color("Background"))
            .shadow(color: Color("\(vibes.color)1"), radius: 0, x: vibes.panX, y: vibes.panY)
            .shadow(color: Color("\(vibes.color)2"), radius: 0, x: vibes.panX, y: vibes.panY)
            .shadow(color: Color("\(vibes.color)3"), radius: 0, x: vibes.panX, y: vibes.panY)
            .onAppear { vibes.panX.negate() }
            .animation(
                .easeInOut(duration: 0.5)
                .repeatCount(vibes.stopAnimation ? 0 : 3, autoreverses: true),
                value: vibes.stopAnimation ? nil : vibes.panX
            )
    }

    

}

