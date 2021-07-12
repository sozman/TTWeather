//
//  AutoCompleteResponse.swift
//  TTWeather
//
//  Created by Sinan Özman on 12.07.2021.
//

import Foundation

struct AutoCompleteResponse: Codable {
    /// Version of the API
    let version: Int
    /// Location Key
    let key: String
    /// Location type such as City, PostalCode, POI, or LatLong
    let type: String
    /// Number applied to Locations, set by factors such as population, political importance, and geographic size.
    let rank: Int
    /// Display name in local dialect set with language code in URL. Default is US English (en-us)
    let localizedName: String
    /// Country Model
    let country: Country
    /// AdministrativeArea Model
    let administrativeArea: AdminisitrativeArea
    
    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case key = "Key"
        case type = "Type"
        case rank = "Rank"
        case localizedName = "LocalizedName"
        case country = "Country"
        case administrativeArea = "AdministrativeArea"
    }
}

/// Country Model
struct Country: Codable {
    /// Unique ISO or Microsoft Localization Code for the country.
    let countryID: String
    /// Country name as displayed in the local dialect set with language code in the URL. Default is US English (en-us)
    let localizedName: String
    
    enum CodingKeys: String, CodingKey {
        case countryID = "ID"
        case localizedName = "LocalizedName"
    }
}

/// AdminisitrativeArea Model
struct AdminisitrativeArea: Codable {
    /// Unique Administrative Area ID for the location
    let administrativeID: String
    /// Administrative Area name displayed in the local dialect set with the language code in the URL. Default is US English (en-us)
    let localizedName: String
    
    enum CodingKeys: String, CodingKey {
        case administrativeID = "ID"
        case localizedName = "LocalizedName"
    }
}
