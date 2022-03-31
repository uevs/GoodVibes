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
                
                Button(action: {
                    vibes.getVibe()
                }, label: {
                    VibeButton(text: "G E T  A  V I B E")
                })
                
                Button(action: {
                    vibes.getVibe()
                }, label: {
                    VibeButton(text: "S E N D  A  V I B E")
                })

                Spacer()
    
            }
        }
    }
}






//struct CustomButton: UIViewRepresentable {
//    func makeUIView(context: Context) -> UIButton {
//        let button = UIButton()
//
//
//        return button
//    }
//
//    func updateUIView(_ uiView: UIButton, context: Context) {
//
//    }
//
//    typealias UIViewType = UIButton
//
//
//}

//struct CustomText: UIViewRepresentable {
//    var text: String
//    func makeUIView(context: Context) -> UILabel {
//        let label = UILabel()
//        label.text = text
//        label.textAlignment = .center
//        label.font = UIFont.boldSystemFont(ofSize: 15)
//
//        let storyboard = UIStoryboard(name: "Storyboard", bundle: .main)
//
//        let viewcontroller = storyboard.instantiateViewController(identifier: "vc")
//        let action = UIAction { _ in
//            if let sheet = viewcontroller.sheetPresentationController {
//                sheet.detents = [.medium(), .large()]
//            }
//
//
//            label.window?.rootViewController?.present(viewcontroller, animated: true)
//
//        }
//
//
//        return label
//    }
//
//    func updateUIView(_ uiView: UILabel, context: Context) {
//    }
//
//
//    typealias UIViewType = UILabel
//
//    func sendVibe() {
//
//
//
//    }
//
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
