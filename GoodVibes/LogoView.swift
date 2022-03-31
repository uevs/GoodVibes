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
            .onAppear { vibes.panX = -5}
            .animation(
                .easeInOut(duration: 0.5)
                .repeatForever(autoreverses: true),
                value: vibes.panX
            )
    }
    

}

//struct LogoView_Previews: PreviewProvider {
//    static var previews: some View {
//        LogoView()
//    }
//}
