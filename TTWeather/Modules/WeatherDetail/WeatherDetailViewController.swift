//
//  WeatherDetailViewController.swift
//  TTWeather
//
//  Created by Sinan Özman on 14.07.2021.
//

import UIKit

class WeatherDetailViewController: BaseVC {
    
    var locationKey: String = ""
    
    override var weatherCondition: WeatherConditions {
        get {
            return super.weatherCondition
        } set {
            super.weatherCondition = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherCondition = .thunderstorm
        print("location: \(locationKey)")
    }
}
