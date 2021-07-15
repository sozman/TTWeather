//
//  WeatherDetailModel.swift
//  TTWeather
//
//  Created by Sinan Özman on 15.07.2021.
//

import Foundation

/// WeatherDetailModel
public struct WeatherDetailModel: Codable {
    /// City Name For Weather Condition
    let cityName: String
    /// Location Key for the API
    let locationKey: String
}
