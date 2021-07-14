//
//  Splash.swift
//  TTWeather
//
//  Created by Sinan Özman on 13.07.2021.
//

import UIKit

class Splash: UIViewController {
    
    /// Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoading()
        self.rotateController { controller in
            // Present Tutorial View Controller
            if controller is TutorialViewController.Type {
                controller.presentSelf(loadFromNib: true, nibName: "Tutorial")
            }
        }
    }
}
