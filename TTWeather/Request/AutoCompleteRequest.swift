//
//  AutoCompleteRequest.swift
//  TTWeather
//
//  Created by Sinan Özman on 12.07.2021.
//

import Foundation

/// Auto Complete Request
struct AutoCompleteRequest: Codable {
    /// Text to use for Autocomplete search
    let text: String
    /// String indicating the language in which to return the resource
    let language: String = "en-us"
    
    enum CodingKeys: String, CodingKey {
        case text = "q"
        case language = "language"
    }
}
