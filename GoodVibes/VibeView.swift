//
//  VibeView.swift
//  GoodVibes
//
//  Created by leonardo on 31/03/22.
//

import SwiftUI

struct VibeView: View {
    @EnvironmentObject var vibes: Vibes

        var body: some View {
        ZStack {
            Rectangle()
      
                .foregroundColor(Color("Gray"))
                .rotation3DEffect(vibes.flip, axis: (x: 0, y: 1, z: 0))
                .shadow(color: Color("\(vibes.color)1"), radius: 0, x: 5, y: 5)
                .shadow(color: Color("\(vibes.color)2"), radius: 0, x: 5, y: 5)
                .shadow(color: Color("\(vibes.color)3"), radius: 0, x: 5, y: 5)
                .padding()
            
            VStack {
                Text(vibes.vibe["Message"] ?? "No Vibes")
                    .foregroundColor(.white)
                    .padding()
                HStack {
                    Spacer()
                    Text("by \(vibes.vibe["Name"] ?? ":(")")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
            }
//            .rotation3DEffect(vibes.flip*2, axis: (x: 0, y: 1, z: 0))
            .padding()
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 300)
    }
}

//struct VibeView_Previews: PreviewProvider {
//    static var previews: some View {
//        VibeView()
//    }
//}
