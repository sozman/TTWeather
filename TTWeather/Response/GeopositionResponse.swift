//
//  GeopositionResponse.swift
//  TTWeather
//
//  Created by Sinan Özman on 13.07.2021.
//

import Foundation

struct GeopositionResponse: Codable {
    /// Version of the api.
    let version: Int
    /// Location key.
    let key: String
    /// Location type such as City, PostalCode, POI, or LatLong.
    let type: String
    /// Number applied to locations, set by factors such as population, political importance, and geographic size.
    let rank: Int
    /// Display name in local dialect set with language code in URL. Default is US English (en-us).
    let localizedName: String
    /// Location name displayed in English.
    let englishName: String
    /// Official postal code provided by our main location data provider for the requested location.
    let primaryPostalCode: String
    /// Region Model
    let region: RegionModel
    /// County Model
    let country: Country
    /// AdministrativeArea Model
    let administrativeArea: AdminisitrativeArea
    /// Time Zone Model
    let timeZone: TimeZoneModel
    /// Geo Position
    let geoPosition: GeoPositionModel
    /// "True" or "False" verification of whether a location is an "alias" or an alternative name or spelling for a requested location.
    let isAlias: Bool
    /// This object will be displayed only if the location is part of a larger metropolitan area or parent city.
    let parentCity: ParentCityModel
    /// SupplementalAdminAreas Model
    let supplementalAdminAreas: SupplementalAdminAreasModel
    /// Array of location-specific products that are available for this location. Products include Alerts, PremiumAirQuality, AirQuality, MinuteCast, and ForecastConfidence. If no location-specific products are available, the array will be empty.
    let dataSets: [String]?
    /// Details
    let details: DetailsModel?
    
    enum CodingKeys: String, CodingKey {
        case version = "Version"
        case key = "Key"
        case type = "Type"
        case rank = "Rank"
        case localizedName = "LocalizedName"
        case englishName = "EnglishName"
        case primaryPostalCode = "PrimaryPostalCode"
        case region = "Region"
        case country = "Country"
        case administrativeArea = "AdministrativeArea"
        case timeZone = "TimeZone"
        case geoPosition = "GeoPosition"
        case isAlias = "IsAlias"
        case parentCity = "ParentCity"
        case supplementalAdminAreas = "SupplementalAdminAreas"
        case dataSets = "DataSets"
        case details = "Details"
    }
}

struct RegionModel: Codable {
    /// Unique region code for the location.
    let regionID: String
    /// Region name displayed in the local dialect set with the language code in the URL. Default is US English (en-us).
    let localizedName: String
    /// Region name displayed in English.
    let englishName: String
    
    enum CodingKeys: String, CodingKey {
        case regionID = "ID"
        case localizedName = "LocalizedName"
        case englishName = "EnglishName"
    }
}

struct TimeZoneModel: Codable {
    /// Official abbreviation code for designated Time Zone.
    let code: String
    /// Official name of designated Time Zone.
    let name: String
    /// Number of hours offset from local GMT time.
    let gmtOffset: Float
    /// Is the location currently observing Daylight Saving time.
    let isDaylightSaving: Bool
    /// Next time that daylight saving time changes. May be NULL.
    let nextOffsetChange: Date?
    
    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case name = "Name"
        case gmtOffset = "GmtOffset"
        case isDaylightSaving = "IsDaylightSaving"
        case nextOffsetChange = "NextOffsetChange"
    }
}

struct GeoPositionModel: Codable {
    /// Geographical coordinate that specifies the north-south position of a point on the earth`s surface.
    let latitude: Double
    /// Geographical coordinate that specifies the east-west position of a point on the earth`s surface.
    let longitude: Double
    /// Elevation Model
    let elevation: GeoPositionElevation
    
    enum CodingKeys: String, CodingKey {
        case latitude = "Latitude"
        case longitude = "Longitude"
        case elevation = "Elevation"
    }
}

struct GeoPositionElevation: Codable {
    /// Metric
    let metric: Elevation
    /// Imperial
    let imperial: Elevation
    
    enum CodingKeys: String, CodingKey {
        case metric = "Metric"
        case imperial = "Imperial"
    }
}

struct Elevation: Codable {
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

struct ParentCityModel: Codable {
    /// This object will be displayed only if the location is part of a larger metropolitan area or parent city.
    let key: String
    /// Parent city name as displayed in local dialect set with language code in the URL. If no language code is selected, the default is English.
    let localizedName: String
    /// Parent city name displayed in English.
    let englishName: String
    
    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case localizedName = "LocalizedName"
        case englishName = "EnglishName"
    }
}

struct SupplementalAdminAreasModel: Codable {
    /// An assigned number, describing the scale of the administrative subdivisions for countries. As the Level number increases, the scale of the subdivision will decrease. Numbers of 10 or greater are reserved for non-political boundaries and should be used independently. May be NULL.
    let level: Int?
    /// Administrative Area name as displayed in local dialect set with language code in the URL. Default is US English (en-us).
    let localizedName: String
    /// Administrative Area name displayed in English.
    let englishName: String
    
    enum CodingKeys: String, CodingKey {
        case level = "Level"
        case localizedName = "LocalizedName"
        case englishName = "EnglishName"
    }
}

struct DetailsModel: Codable {
    /// Location key.
    let key: String
    /// Weather station code of the location.
    let stationCode: String
    /// GMT offset of the weather station. May be NULL.
    let stationGmtOffset: Float?
    /// Temperature and precipitation band map code.
    let bandMap: String
    /// Source of the climatology data for the location.
    let climo: String
    /// Local radar code associated with the location.
    let localRadar: String
    /// Media region associated with the location.
    let mediaRegion: String
    /// Metar station associated with the location.
    let metar: String
    /// City level radar code.
    let nxMetro: String
    /// State Level radar code.
    let nxState: String
    /// Reported population of the location. May be NULL.
    let population: Int?
    /// Primary warning county code.
    let primaryWarningCountyCode: String
    /// Primary warning zone code.
    let primaryWarningZoneCode: String
    /// Satellite associated with the location.
    let satellite: String
    /// Synoptic station associated with the location.
    let synoptic: String
    /// Marine station code.
    let marineStation: String
    /// GMT offset of the marine station. May be NULL.
    let marineStationGMTOffset: Float?
    /// Code that identifies city or region for video.
    let videoCode: String
    /// Unique number that indentifies a display partner for the Designated Marketing Area (DMA). Language dependent. May be NULL.
    let partnerID: Int?
    /// DMA Model
    let dma: DMAModel
    /// Sources Model
    let sources: DetailSourcesModel
    /// Optimized postal code, which may be the postal code of the location or a nearby metropolitan area. May be empty.
    let canonicalPostalCode: String?
    /// Optimized locationKey, which may be the locationKey of the location or a nearby metropolitan area. May be empty.
    let canonicalLocationKey: String?
    /// Country ID/location name/postal code or Country ID/location name/Location Key when the location does not have a postal code. For AccuWeather internal use only.
    let locationStem: String
    
    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case stationCode = "StationCode"
        case stationGmtOffset = "StationGmtOffset"
        case bandMap = "BandMap"
        case climo = "Climo"
        case localRadar = "LocalRadar"
        case mediaRegion = "MediaRegion"
        case metar = "Metar"
        case nxMetro = "NXMetro"
        case nxState = "NXState"
        case population = "Population"
        case primaryWarningCountyCode = "PrimaryWarningCountyCode"
        case primaryWarningZoneCode = "PrimaryWarningZoneCode"
        case satellite = "Satellite"
        case synoptic = "Synoptic"
        case marineStation = "MarineStation"
        case marineStationGMTOffset = "MarineStationGMTOffset"
        case videoCode = "VideoCode"
        case partnerID = "PartnerID"
        case dma = "DMA"
        case sources = "Sources"
        case canonicalPostalCode = "CanonicalPostalCode"
        case canonicalLocationKey = "CanonicalLocationKey"
        case locationStem = "LocationStem"
    }
}

struct DMAModel: Codable {
    /// Numeric Designated Marketing Area (DMA) identifier.
    let dmaID: String
    /// Name of the DMA in English.
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case dmaID = "ID"
        case name = "EnglishName"
    }
}

struct DetailSourcesModel: Codable {
    /// Type of data the source provides.
    let dataType: String
    /// Name of the data provider.
    let source: String
    /// ID associated with the source. Can be used as a key.
    let sourceID: Int
    
    enum CodingKeys: String, CodingKey {
        case dataType = "DataType"
        case source = "Source"
        case sourceID = "SourceId"
    }
}
