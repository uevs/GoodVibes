//
//  ContentView.swift
//  GoodVibes
//
//  Created by leonardo on 31/03/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vibes: Vibes

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {
                LogoView()
                    .padding()
                Spacer()
                VibeView()
                Spacer()
                NewVibeButton()
                Spacer()
    
            }
        }
    }
    

}

struct LogoView: View {
    @EnvironmentObject var vibes: Vibes

    
    @State var panBlue: CGFloat = 5
    
    var body: some View {
        Text("G O O D\nV I B E S")
            .font(.system(size: 80)).bold()
            .foregroundColor(Color("Background"))
            .shadow(color: Color("\(vibes.color)1"), radius: 0, x: panBlue, y: 0)
            .shadow(color: Color("\(vibes.color)2"), radius: 0, x: panBlue, y: 0)
            .shadow(color: Color("\(vibes.color)3"), radius: 0, x: panBlue, y: 0)
            .onAppear { panBlue = -5}
            .animation(
                .easeInOut(duration: 0.5)
                .repeatForever(autoreverses: true),
                value: panBlue
            )
    }
    

}

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
            .rotation3DEffect(vibes.flip*2, axis: (x: 1, y: 0, z: 0))
            .padding()
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 300)
    }
}

struct NewVibeButton: View {
    @EnvironmentObject var vibes: Vibes
    
    var body: some View {
        Button(action: {
            vibes.getVibe()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("Gray"))
                    .shadow(color: Color("\(vibes.color)1"), radius: 0, x: 2, y: 2)
                    .shadow(color: Color("\(vibes.color)2"), radius: 0, x: 2, y: 2)
                    .shadow(color: Color("\(vibes.color)3"), radius: 0, x: 2, y: 2)
                Text("N E W  V I B E")
                    .foregroundColor(.white)
                    .bold()
            }
            .frame(width: 200, height: 50)

            
        })
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
