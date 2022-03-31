//
//  ContentView.swift
//  GoodVibes
//
//  Created by leonardo on 31/03/22.
//

import SwiftUI

struct ContentView: View {
    @State var color: String = "Pink"
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {
                Logo(color: color)
                    .padding()
                Spacer()
                Vibe(color: color)
                Spacer()
                NewVibe(color: color)
                Spacer()
                
            }
            
        }
    }
}

struct Logo: View {
    @State var panBlue: CGFloat = 5
    let color: String
    var body: some View {
        Text("G O O D\nV I B E S")
            .font(.system(size: 80)).bold()
            .foregroundColor(Color("Background"))
            .shadow(color: Color("\(color)1"), radius: 0, x: panBlue, y: 0)
            .shadow(color: Color("\(color)2"), radius: 0, x: panBlue, y: 0)
            .shadow(color: Color("\(color)3"), radius: 0, x: panBlue, y: 0)
            .onAppear { panBlue = -5}
            .animation(
                .easeInOut(duration: 0.5)
                .repeatForever(autoreverses: true),
                value: panBlue
            )
    }
}

struct Vibe: View {
    var color: String
    var body: some View {
        ZStack {
            Rectangle()
      
                .foregroundColor(Color("Gray"))
                .shadow(color: Color("\(color)1"), radius: 0, x: 5, y: 5)
                .shadow(color: Color("\(color)2"), radius: 0, x: 5, y: 5)
                .shadow(color: Color("\(color)3"), radius: 0, x: 5, y: 5)
                .padding()
            
            VStack {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia lacus ante, sit amet sagittis odio lacinia a. Donec aliquam urna eget lectus vulputate, non dictum elit sagittis.")
                    .foregroundColor(.white)
                    .padding()
                HStack {
                    Spacer()
                    Text("by Anon")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                }
            }
            .padding()
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 300)
    }
}

struct NewVibe: View {
    var color: String
    
    var body: some View {
        Button(action: {
            //newvibe
            
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("Gray"))
                    .shadow(color: Color("\(color)1"), radius: 0, x: 2, y: 2)
                    .shadow(color: Color("\(color)2"), radius: 0, x: 2, y: 2)
                    .shadow(color: Color("\(color)3"), radius: 0, x: 2, y: 2)
                Text("V I B E")
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
