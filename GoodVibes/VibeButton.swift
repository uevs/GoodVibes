//
//  Vibebutton.swift
//  GoodVibes
//
//  Created by leonardo on 31/03/22.
//

import SwiftUI

struct VibeButton: View {
    @EnvironmentObject var vibes: Vibes
    var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("Gray"))
                .shadow(color: Color("\(vibes.color)1"), radius: 0, x: 2, y: 2)
                .shadow(color: Color("\(vibes.color)2"), radius: 0, x: 2, y: 2)
                .shadow(color: Color("\(vibes.color)3"), radius: 0, x: 2, y: 2)
            Text(text)
                .foregroundColor(.white)
                .bold()
        }
        .frame(width: 200, height: 50)
        
    }
}
//
//struct Vibebutton_Previews: PreviewProvider {
//    static var previews: some View {
//        VibeButton(text: "Test")
//    }
//}
