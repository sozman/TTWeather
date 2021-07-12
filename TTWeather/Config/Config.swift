//
//  Config.swift
//  TTWeather
//
//  Created by Sinan Özman on 12.07.2021.
//

import Foundation

/// Configration Class
public class Config {
    /// Base API URL
    static let BaseAPIURL = "http://dataservice.accuweather.com/api"
    /// API Key
    static let ApiKey = "YOUR_API_KEY"
    /** Request Data Visibility settings
     - returns: Data Request Visibility Status
     */
    static var DataRequestDebugMode: Bool {
        #if DEBUG
            return true
        #else
            return false
        #endif
    }

    /** Response Data Visibility settings
     - returns: Data Response Visibility Status
     */
    static var DataResponseDebugMode: Bool {
        #if DEBUG
            return true
        #else
            return false
        #endif
    }

}
