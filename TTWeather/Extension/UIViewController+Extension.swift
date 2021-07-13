//
//  UIViewController+Extension.swift
//  TTWeather
//
//  Created by Sinan Özman on 13.07.2021.
//

import UIKit

extension UIViewController {
    /// Load Controller from Nib
    /// - Returns: UIViewController
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
    /// Present Root Controller
    static func presentSelf(loadFromNib: Bool = false) {
        guard let windows = UIApplication.shared.windows.first else {
            return
        }
        windows.rootViewController = loadFromNib ? self.loadFromNib() : self.init()
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
}
