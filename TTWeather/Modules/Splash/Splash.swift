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
//        rotateController().presentSelf()
        self.showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.removeLoading()
        }
    }
    
    /// Get View Controller for next step App Cycle
    /// - Returns: UIViewController Type
    fileprivate func rotateController() -> UIViewController.Type {
        if UserSession.shared.firstTutorial ?? true {
            // Tutorial Controller
            UserSession.shared.save(firstTutorial: false)
            return UIViewController.self
        } else if LocationManager.shared.locations.count != 0 {
            // Main Controller
            return UIViewController.self
        } else {
            // Search Controller
            return UIViewController.self
        }
    }
}
