//
//  WeatherDetailViewController.swift
//  TTWeather
//
//  Created by Sinan Özman on 14.07.2021.
//

import UIKit

class WeatherDetailViewController: BaseVC {
    
    var locationKey: String = ""
    
    private let networkClient = NetworkClient()
    
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
        let req = CurrentRequest(language: "en-us", details: true)
        networkClient.executeRequest(endpoint: CurrentEndpoint.getCurrent(
                                        request: req,
                                        locationKey: self.locationKey)
                                     , model: CurrentResponse.self) { model, error in
            print(model)
            print(error)
        }
    }
}
