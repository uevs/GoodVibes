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

struct ModalButton: UIViewRepresentable {
    @EnvironmentObject var vibes: Vibes
    
    typealias UIViewType = UIButton

    var text: String
    
    func makeUIView(context: Context) -> UIButton {
        
        let button = UIButton(type: .custom)    
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)

        let action = UIAction { _ in
            vibes.sendVibe()
        }

        button.addAction(action, for: .touchUpInside)
                
        button.tintColor = .label
        
        return button
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {

        let storyboard = UIStoryboard.init(name: "Storyboard", bundle: .main)
        let presentedViewController = storyboard.instantiateViewController(withIdentifier: "vc") as! ViewController
        
        presentedViewController.changeColor(color: vibes.color)
        
        presentedViewController.presentationController?.delegate = context.coordinator
        
        let sheet = presentedViewController.presentationController as! UISheetPresentationController
        sheet.prefersGrabberVisible = true
        sheet.detents = [.medium()]
        
        if vibes.sending {
            uiView.window?.rootViewController?.present(presentedViewController, animated: true)
        } else {
            uiView.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(vibes: vibes)
    }
    
    class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        var vibes: Vibes
        
        init(vibes: Vibes, onDismiss: (() -> Void)? = nil) {
            self.vibes = vibes
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            vibes.reset()

        }
        
        
    }

}
