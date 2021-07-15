//
//  ForecastRequest.swift
//  TTWeather
//
//  Created by Sinan Özman on 14.07.2021.
//

import Foundation

/// Forecast Request
struct ForecastRequest: Codable {
    /// String indicating the language in which to return the resource
    var language: String = "en-us"
    /// Boolean value specifies whether or not to include full details in the response.
    var details: Bool = false
    /// Boolean value specifies whether or not to display metric values.
    var metric: Bool = false
}
