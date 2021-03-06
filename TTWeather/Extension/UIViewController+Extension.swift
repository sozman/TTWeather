//
//  UIViewController+Extension.swift
//  TTWeather
//
//  Created by Sinan Özman on 13.07.2021.
//

import UIKit

typealias PresentationCompletion = (UIViewController) -> Void

extension UIViewController {
    /// Load Controller from Nib
    /// - Returns: UIViewController
    static func loadFromNib(nibName: String? = nil) -> Self {
        func instantiateFromNib<T: UIViewController>(nibName: String?) -> T {
            if let nibName = nibName {
                return T.init(nibName: nibName, bundle: nil)
            }
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib(nibName: nibName)
    }
    /// Present Root Controller
    static func presentSelf(loadFromNib: Bool = false, nibName: String? = nil, completion: PresentationCompletion? = nil) {
        guard let windows = UIApplication.shared.windows.first else {
            return
        }
        let controller = loadFromNib ? self.loadFromNib(nibName: nibName) : self.init()
        completion?(controller)
        windows.rootViewController = controller
    }
    
    /// Present Controller
    static func presentController(loadFromNib: Bool = false, nibName: String? = nil, setupBlock: PresentationCompletion? = nil) {
        let controller = loadFromNib ? self.loadFromNib(nibName: nibName) : self.init()
        setupBlock?(controller)
    }
    
    /// Add Loading View on the Content View
    func showLoading() {
        let loadingView = LoadingView()
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loadingView)
        
        loadingView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        loadingView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loadingView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    /// Remove Loading View on the Content View
    func removeLoading() {
       self.view.subviews.filter { view in
            return view is LoadingView
       }.forEach { view in
            view.removeFromSuperview()
        }
    }
    /// Get View Controller for next step App Cycle
    /// - Returns: UIViewController Type
    func rotateController(completion: (UIViewController.Type) -> Void) {
        if (UserSession.shared.firstTutorial ?? true) {
            // Tutorial Controller
            UserSession.shared.save(firstTutorial: false)
             completion(TutorialViewController.self)
        } else if LocationManager.shared.locations.count != 0 {
            // Main Controller
            completion(HomeVC.self)
        } else {
            // Search Controller
            completion(SearchViewController.self)
        }
        removeLoading()
    }
}
