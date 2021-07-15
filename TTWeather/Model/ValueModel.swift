//
//  ValueModel.swift
//  TTWeather
//
//  Created by Sinan Özman on 14.07.2021.
//

import Foundation

/// ValueModel
struct ValueModel: Codable {
    /// Rounded value in specified units. May be NULL.
    let value: Double?
    /// Type of unit.
    let unit: String
    /// Numeric ID associated with the type of unit being displayed.
    let unitType: Int
    
    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
    }
}
