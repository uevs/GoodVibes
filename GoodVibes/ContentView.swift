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
                if !vibes.hideVibe {
                    VibeView()
                    
                }
                Spacer()
                
                Button(action: {
                    vibes.getVibe()
                    Task {
                        await vibes.updateVibes()
                    }
                }, label: {
                    VibeButton(text: "G E T  A  V I B E")
                })
                
                ZStack {
                    VibeButton(text:"")
                    ModalButton(text: "S E N D  A  V I B E")
                        .frame(width: 200, height: 50)
                }

                Spacer()
    
            }
        }
        .onChange(of: vibes.newVibe["message"], perform: { newValue in
            Task  {
                await vibes.uploadVibe()

            }
        })
        .onAppear {
            Task {
                await vibes.updateVibes()
                
            }
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
