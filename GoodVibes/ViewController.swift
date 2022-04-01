//
//  ViewController.swift
//  GoodVibes
//
//  Created by leonardo on 01/04/22.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func changeColor(color: String) {
        view.tintColor = UIColor(named: "\(color)1")
    }

}
