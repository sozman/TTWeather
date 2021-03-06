//
//  Tutorial.swift
//  TTWeather
//
//  Created by Sinan Özman on 13.07.2021.
//

import UIKit

class TutorialViewController: UIViewController {
    
    // MARK: - View Object
    
    /// Access Permission Button Outlet
    @IBOutlet private weak var allowAccessButtonOutlet: UIButton! {
        didSet {
            allowAccessButtonOutlet.layer.cornerRadius = 10
        }
    }
    
    // MARK: - View Did Load
    
    /// Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Supported Function
    
    /// Rotate View Controller
    private func rotate() {
        self.rotateController { controller in
            if controller is TutorialViewController.Type {
                // TODO: Alert again permission
            }
            // Present Search View Controller
            else if controller is SearchViewController.Type {
                controller.presentSelf(loadFromNib: true, nibName: "Search")
            }
        }
    }
    
    // MARK: - Button Action
    
    /// Access Permission Button Action
    /// - Parameter sender: Access Permission Button Outlet
    @IBAction private func allowAccessButtonAction(_ sender: UIButton) {
        // Check user location permission
        if !LocationHelper.shared.checkLocationPermission() {
            // Request permission
            LocationHelper.shared.permissionRequest()
            rotate()
        } else {
            rotate()
        }
    }
}
