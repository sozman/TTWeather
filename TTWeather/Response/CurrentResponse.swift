//
//  CurrentResponse.swift
//  TTWeather
//
//  Created by Sinan Özman on 15.07.2021.
//

import Foundation

/// Current Response Model
struct CurrentResponse: Codable {
    /// DateTime of the current observation, displayed in ISO8601 format.
    let localObservationDateTime: String
    /// DateTime of the current observation, displayed as the number of seconds that have elapsed since January 1, 1970 (midnight UTC/GMT).
    let epochTime: Int
    /// Phrase description of the current weather condition. Displayed in the language set with language code in URL.
    let weatherText: String
    /// Numeric value representing an image that displays the current condition described by WeatherText. May be NULL.
    let weatherIcon: Int?
    /// Local Source Model
    let localSource: LocalSource
    /// Flag indicating the time of day (true=day, false=night)
    let isDayTime: Bool
    /// Temperature Model
    let temperature: Temperature
    /// Patented AccuWeather RealFeel Temperature. Contains Metric and Imperial Values.
    let realFeelTemperature: Temperature
    /// Patented AccuWeather RealFeel Temperature in the shade. Contains Metric and Imperial Values.
    let realFeelTemperatureShade: Temperature
    /// Relative humidity. May be NULL.
    let relativeHumidity: Int?
    /// Dew Point
    let dewPoint: Temperature
    /// Wind
    let wind: WindModel
    /// WindGust
    let windGust: WindGustModel
    /// Measure of the strength of the ultraviolet radiation from the sun. May be NULL.
    let uvIndex: Int?
    /// Text associated with the UVIndex.
    let uvIndexText: String
    /// Visibility
    let visibility: Temperature
    /// Cause of limited visibility.
    let obstructionsToVisibility: String
    /// Number representing the percentage of the sky that is covered by clouds. May be NULL.
    let cloudCover: Int?
    /// Cloud ceiling. Contains Metric and Imperial Values.
    let ceiling: Temperature
    /// Atmospheric pressure. Contains Metric and Imperial Values.
    let pressure: Temperature
    /// Pressure Tendency
    let pressureTendency: PressureTendency
    /// Departure from the temperature observed 24 hours ago. Contains Metric and Imperial Values.
    let past24HourTemperatureDeparture: Temperature
    /// Perceived outdoor temperature caused by the combination of air temperature, relative humidity, and wind speed. Contains Metric and Imperial Values.
    let apparentTemperature: Temperature
    /// Perceived air temperature on exposed skin due to wind. Contains Metric and Imperial Values.
    let windChillTemperature: Temperature
    /// The temperature to which air may be cooled by evaporating water into it at constant pressure until it reaches saturation. Contains Metric and Imperial Values.
    let wetBulbTemperature: Temperature
    /// Amount of precipitation (liquid water equivalent) that has fallen in the past hour. Contains Metric and Imperial Values.
    let precip1hr: Temperature
    /// Precipitation Summary
    let precipitationSummary: PrecipitationSummary
    /// Temperature Summary
    let temperatureSummay: TemperatureSummary
    /// Link to current conditions for the requested location on AccuWeather`s mobile site.
    let mobileLink: String
    /// Link to current conditions for the requested location on AccuWeather`s web site.
    let link: String
    /// Flag indicating the presence or absence of precipitation. True indicates the presence of precipitation, false indicates the absence of precipitation.
    let hasPrecipitation: Bool
    /// If precipitation is present, the type of precipitation will be returned. Possible values are Rain, Snow, Ice, or Mixed. Null in the absence of precipitation.
    let precipitationType: String
    /// The relative humidity in the user's home or building.
    let indoorRelativeHumidiy: Bool
    
    enum CodingKeys: String, CodingKey {
        case localObservationDateTime = "LocalObservationDateTime"
        case epochTime = "EpochTime"
        case weatherText = "WeatherText"
        case weatherIcon = "WeatherIcon"
        case localSource = "LocalSource"
        case isDayTime = "IsDayTime"
        case temperature = "Temperature"
        case realFeelTemperature = "RealFeelTemperature"
        case realFeelTemperatureShade = "RealFeelTemperatureShade"
        case relativeHumidity = "RelativeHumidity"
        case dewPoint = "DewPoint"
        case wind = "Wind"
        case windGust = "WindGust"
        case uvIndex = "UVIndex"
        case uvIndexText = "UVIndexText"
        case visibility = "Visibility"
        case obstructionsToVisibility = "ObstructionsToVisibility"
        case cloudCover = "CloudCover"
        case ceiling = "Ceiling"
        case pressure = "Pressure"
        case pressureTendency = "PressureTendency"
        case past24HourTemperatureDeparture = "Past24HourTemperatureDeparture"
        case apparentTemperature = "ApparentTemperature"
        case windChillTemperature = "WindChillTemperature"
        case wetBulbTemperature = "WetBulbTemperature"
        case precip1hr = "Precip1hr"
        case precipitationSummary = "PrecipitationSummary"
        case temperatureSummay = "TemperatureSummary"
        case mobileLink = "MobileLink"
        case link = "Link"
        case hasPrecipitation = "HasPrecipitation"
        case precipitationType = "PrecipitationType"
        case indoorRelativeHumidiy = "IndoorRelativeHumidity"
    }
}

/// Temperature Model
struct Temperature: Codable {
    /// Metric Model
    let metric: ValueModel
    /// Imperial Model
    let imperial: ValueModel
    
    enum CodingKeys: String, CodingKey {
        case metric = "Metric"
        case imperial = "Imperial"
    }
}

/// PressureTendency Model
struct PressureTendency: Codable {
    /// Description of the pressure tendency in the language specified by language code in the URL.
    let localizedText: String
    /// Pressure tendency code regardless of language. (F=falling, S=steady, R=rising)
    let code: String
    
    enum CodingKeys: String, CodingKey {
        case localizedText = "LocalizedText"
        case code = "Code"
    }
}

/// PrecipitationSummary Model
struct PrecipitationSummary: Codable {
    /// Deprecated. Please use the precipitation summary for a specific time span.
    let precipitation: Temperature
    /// The amount of precipitation (liquid equivalent) that has fallen in the past hour. Contains Metric and Imperial Values.
    let pastHour: Temperature
    /// The amount of precipitation (liquid equivalent) that has fallen in the past 3 hours. Contains Metric and Imperial Values.
    let past3Hours: Temperature
    /// The amount of precipitation (liquid equivalent) that has fallen in the past 6 hours. Contains Metric and Imperial Values.
    let past6Hours: Temperature
    /// The amount of precipitation (liquid equivalent) that has fallen in the past 9 hours. Contains Metric and Imperial Values.
    let past9Hours: Temperature
    /// The amount of precipitation (liquid equivalent) that has fallen in the past 12 hours. Contains Metric and Imperial Values.
    let past12Hours: Temperature
    /// The amount of precipitation (liquid equivalent) that has fallen in the past 18 hours. Contains Metric and Imperial Values.
    let past18Hours: Temperature
    /// The amount of precipitation (liquid equivalent) that has fallen in the past 24 hours. Contains Metric and Imperial Values.
    let past24Hours: Temperature
    
    enum CodingKeys: String, CodingKey {
        case precipitation = "Precipitation"
        case pastHour = "PastHour"
        case past3Hours = "Past3Hours"
        case past6Hours = "Past6Hours"
        case past9Hours = "Past9Hours"
        case past12Hours = "Past12Hours"
        case past18Hours = "Past18Hours"
        case past24Hours = "Past24Hours"
    }
}

/// TemperatureSummary Model
struct TemperatureSummary: Codable {
    /// Past 6 Hour Range
    let past6HourRange: TemperatureModel
    /// Past 12 Hour Range
    let past12HourRange: TemperatureModel
    /// Past 24 Hour Range
    let past24HourRange: TemperatureModel
    
    enum CodingKeys: String, CodingKey {
        case past6HourRange = "Past6HourRange"
        case past12HourRange = "Past12HourRange"
        case past24HourRange = "Past24HourRange"
    }
}
