//
//  GeopositionRequest.swift
//  TTWeather
//
//  Created by Sinan Özman on 13.07.2021.
//

import Foundation

/// Geoposition Request
struct GeopositionRequest: Codable {
    /// Text to search for. Int this case, the text should be a comma-separated lat/lon pair (lat,lon).
    var text: String
    /// String indicating the language in which to return the resource
    var language: String
    /// Boolean value specifies whether or not to include full details in the response.
    var details: Bool
    /// When toplevel=true, the city with the highest rank will be returned. Large cities have higher rank than the neighborhoods within them, so toplevel=true delivers a more generic location result. (Example: 40.73,-74.00 returns Greenwich Village, NY when toplevel=false. If toplevel=true, the same lat/lon pair will return New York, NY.)
    var toplevel: Bool
    
    /// Decleration Request
    /// - Parameters:
    ///   - geo: Geometric Location informations
    ///   - language: Response language
    ///   - details: Full Detail Status
    ///   - toplevel: Order by rank
    init(
        geo: GeoText,
        language: String = "en-us",
        details: Bool = false,
        toplevel: Bool = true) {
        self.text = geo.getText()
        self.language = language
        self.details = details
        self.toplevel = toplevel
    }
}

/// Locations coordinate model
struct GeoText {
    /// Latitude
    let latitude: String
    /// Longitude
    let longitude: String
    
    /// Setup coordinates for the request
    /// - Returns: Text to search for.
    func getText() -> String {
        return "\(latitude),\(longitude)"
    }
}
