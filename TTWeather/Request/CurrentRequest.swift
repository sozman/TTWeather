//
//  CurrentRequest.swift
//  TTWeather
//
//  Created by Sinan Özman on 15.07.2021.
//

import Foundation

/// Current Request Model
struct CurrentRequest: Codable {
    /// String indicating the language in which to return the resource
    var language: String = "en-us"
    /// Boolean value specifies whether or not to include full details in the response.
    var details: Bool = true
}
