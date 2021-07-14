//
//  BaseVC.swift
//  TTWeather
//
//  Created by Sinan Özman on 14.07.2021.
//

import UIKit

/// Base View Controller
open class BaseVC: UIViewController {
    // MARK: - Properties
    
    /// Weather Status
    open var weatherCondition: WeatherConditions = .thunderstorm {
        didSet {
            self.setupUI()
        }
    }
    
    // MARK: - View Object
    
    /// Background Image View
    @IBOutlet private weak var backgroundImageView: UIImageView!
    
    /// Image View for Effect
    @IBOutlet private weak var effectImageView: UIImageView!
    
    // MARK: - View Did Load
    
    /// Called after the controller's view is loaded into memory.
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    // MARK: - View Will Appear
    
    /// Notifies the view controller that its view is about to be added to a view hierarchy.
    /// - Parameter animated: animation
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupUI()
    }
    
    // MARK: - View Will Disappear
    
    /// Notifies the view controller that its view is about to be removed from a view hierarchy.
    /// - Parameter animated: animation
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: - View Did Disappear
    
    /// Notifies the view controller that its view was removed from a view hierarchy.
    /// - Parameter animated: animation
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // MARK: - View Did Appear
    
    /// Notifies the view controller that its view was added to a view hierarchy.
    /// - Parameter animated: animation
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Setup UI For BaseVC
    
    /// Setup Background images
    private func setupUI() {
        var backgroundImage: UIImage
        var effectImage: UIImage
        
        switch self.weatherCondition {
        
        case .thunderstorm:
            backgroundImage = UIImage(named: "night") ?? UIImage()
            effectImage = UIImage(named: "thunderEffect") ?? UIImage()
        case .rain:
            backgroundImage = UIImage(named: "cloud") ?? UIImage()
            effectImage = UIImage(named: "rainEffect") ?? UIImage()
        case .snow:
            backgroundImage = UIImage(named: "snow") ?? UIImage()
            effectImage = UIImage(named: "snowEffect") ?? UIImage()
        case .ice:
            backgroundImage = UIImage(named: "snow") ?? UIImage()
            effectImage = UIImage(named: "snowEffect") ?? UIImage()
        case .sunny:
            backgroundImage = UIImage(named: "sunny") ?? UIImage()
            effectImage = UIImage(named: "sunnyEffect") ?? UIImage()
        }
        
        self.backgroundImageView.image = backgroundImage
        self.effectImageView.image = effectImage
    }
}

// MARK: - Weather Conditions

/// Weather Condition
public enum WeatherConditions {
    case thunderstorm
    case rain
    case snow
    case ice
    case sunny
}
