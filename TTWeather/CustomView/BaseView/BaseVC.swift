//
//  BaseVC.swift
//  TTWeather
//
//  Created by Sinan Özman on 14.07.2021.
//

import UIKit
import SnapKit

/// Base View Controller
open class BaseVC: UIViewController {
    // MARK: - Properties
    
    /// Weather Status
    open var weatherCondition: WeatherConditions = .sunny {
        didSet {
            self.setupUI()
        }
    }
    
    /// Is Day Time
    open var isDayTime: Bool = true {
        didSet {
            self.setupUI()
        }
    }
    
    // MARK: - View Object
    
    /// Background Image View
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.zPosition = -2
        return imageView
    }()
    
    /// Image View for Effect
    private lazy var effectImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.zPosition = -1
        return imageView
    }()
    
    // MARK: - View Did Load
    
    /// Called after the controller's view is loaded into memory.
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.setupUI()
    }
    
    // MARK: - View Will Appear
    
    /// Notifies the view controller that its view is about to be added to a view hierarchy.
    /// - Parameter animated: animation
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
    
    /// Setup Layout
    private func setupLayout() {
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        view.addSubview(effectImageView)
        effectImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
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
        
        if !self.isDayTime {
            backgroundImage = UIImage(named: "night") ?? UIImage()
        }
        self.backgroundImageView.image = backgroundImage
        self.effectImageView.image = effectImage
    }
}

// MARK: - Weather Conditions

public enum WeatherConditions {
    case thunderstorm
    case rain
    case snow
    case ice
    case sunny
}
