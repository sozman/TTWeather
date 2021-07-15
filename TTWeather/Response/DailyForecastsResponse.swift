//
//  DailyForecastsResponse.swift
//  TTWeather
//
//  Created by Sinan Özman on 14.07.2021.
//

import Foundation

/// 10 Days of Daily Forecasts
struct DailyForecastsResponse: Codable {
    /// Head Line
    let headLine: HeadlineModel
    /// Daily Forecasts
    let dailyForecasts: DailyForecastsModel
    /// DailyForecast Model
    let dailyForecast: DailyForecastModel
    
    enum CodingKeys: String, CodingKey {
        case headLine = "Headline"
        case dailyForecasts = "DailyForecasts"
        case dailyForecast = "DailyForecast"
    }
}

/// Headline Model
struct HeadlineModel: Codable {
    /// DateTime, displayed in ISO8601 format, when the Headline is in effect.
    let effectiveDate: String
    /// Effective Date of the headline, displayed as the number of seconds that have elapsed since January 1, 1970 (midnight UTC/GMT).
    let effectiveEpochDate: Int
    /// Severity of the headline, displayed as an integer. The lower the number, the greater the severity. 0 = Unknown 1 = Significant 2 = Major 3 = Moderate 4 = Minor 5 = Minimal 6 = Insignificant 7 = Informational
    let severity: Int
    /// Text of the headline, which represents the most significant weather event over the next 5 days. Displayed in the language specified by language code in URL.
    let text: String
    /// Category of the headline.
    let category: String
    /// DateTime, displayed in ISO8601 format, when the Headline expires. May be NULL.
    let endDate: String?
    /// End Date of the headline, displayed as the number of seconds that have elapsed since January 1, 1970 (midnight UTC/GMT).
    let endEpochDate: Int
    /// Link to the extended forecast for the requested location on AccuWeather`s mobile site.
    let mobileLink: String
    /// Link to the extended forecast for the requested location on AccuWeather`s web site.
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case effectiveDate = "EffectiveDate"
        case effectiveEpochDate = "EffectiveEpochDate"
        case severity = "Severity"
        case text = "Text"
        case category = "Category"
        case endDate = "EndDate"
        case endEpochDate = "EndEpochDate"
        case mobileLink = "MobileLink"
        case link = "Link"
    }
}

/// DailyForecasts Model
struct DailyForecastsModel: Codable {
    /// Date of the forecast, displayed as the number of seconds that have elapsed since January 1, 1970 (midnight UTC/GMT).
    let epochDate: Int
    /// Daily Sun Model
    let dailySunModel: DailySunModel
    /// Daily Moon Model
    let dailyMoonModel: DailyMoonModel
    /// Temperature Model
    let temperature: TemperatureModel
    /// RealFeelTemperature Model
    let realFeelTemperature: RealFeelTemperature
    /// RealFeelTemperatureShade Model
    let realFeelTemperatureShade: RealFeelTemperatureShade
    /// Number of hours of sun.
    let hoursOfSun: Float
    /// Degree Day Summary Model
    let degreeDaySummary: DegreeDaySummary
    /// Air And Pollen Model
    let airAndPollen: AirAndPollen
    /// Day Model
    let day: DayModel
    /// Night Model
    let night: NightModel
    /// Forecast sources.
    let sources: String
    /// Link to the daily forecast for the requested location on AccuWeather`s mobile site.
    let mobileLink: String
    /// Link to the daily forecast for the requested location on AccuWeather`s web site.
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case epochDate = "EpochDate"
        case dailySunModel = "Sun"
        case dailyMoonModel = "Moon"
        case temperature = "Temperature"
        case realFeelTemperature = "RealFeelTemperature"
        case realFeelTemperatureShade = "RealFeelTemperatureShade"
        case hoursOfSun = "HoursOfSun"
        case degreeDaySummary = "DegreeDaySummary"
        case airAndPollen = "AirAndPollen"
        case day = "Day"
        case night = "Night"
        case sources = "Sources"
        case mobileLink = "MobileLink"
        case link = "Link"
    }
}

/// Daily Sun Model
struct DailySunModel: Codable {
    /// Sun rise displayed in ISO8601 format.
    let rise: String
    /// Sun rise displayed as the number of seconds that have elapsed since January 1, 1970 (midnight UTC/GMT).
    let epochRise: Int
    /// Sun set displayed in ISO8601 format.
    let set: String
    /// Sun set displayed as the number of seconds that have elapsed since January 1, 1970 (midnight UTC/GMT).
    let epochSet: Int
    
    enum CodingKeys: String, CodingKey {
        case rise = "Rise"
        case epochRise = "EpochRise"
        case set = "Set"
        case epochSet = "EpochSet"
    }
}

/// Daily Moon Model
struct DailyMoonModel: Codable {
    /// Moon rise displayed in ISO8601 format.
    let rise: String
    /// Moon rise displayed as the number of seconds that have elapsed since January 1, 1970 (midnight UTC/GMT).
    let epochRise: Int
    /// Moon set displayed in ISO8601 format.
    let set: String
    /// Moon set displayed as the number of seconds that have elapsed since January 1, 1970 (midnight UTC/GMT).
    let epochSet: Int
    /// Moon phase.
    let phase: String
    /// The number of days since the new moon.
    let age: Int
    
    enum CodingKeys: String, CodingKey {
        case rise = "Rise"
        case epochRise = "EpochRise"
        case set = "Set"
        case epochSet = "EpochSet"
        case phase = "Phase"
        case age = "Age"
    }
}

/// TemperatureModel
struct TemperatureModel: Codable {
    /// Minimum Model
    let minimum: ValueModel
    /// Maximum Model
    let maximum: ValueModel
    
    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
    }
}

/// RealFeelTemperature Model
struct RealFeelTemperature: Codable {
    /// Minimum Model
    let minimum: ValueModel
    /// Maximum Model
    let maximum: ValueModel
    
    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
    }
}

/// RealFeelTemperatureShade Model
struct RealFeelTemperatureShade: Codable {
    /// Minimum Model
    let minimum: ValueModel
    /// Maximum Model
    let maximum: ValueModel
    
    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
    }
}

/// DegreeDaySummary Model
struct DegreeDaySummary: Codable {
    /// Heating Model
    let heating: ValueModel
    /// Cooling Model
    let cooling: ValueModel
    
    enum CodingKeys: String, CodingKey {
        case heating = "Heating"
        case cooling = "Cooling"
    }
}

/// AirAndPollen Model
struct AirAndPollen: Codable {
    /// Name of the pollen or air pollutant.
    let name: String
    /// Value of the pollutant. Values associated with mold, grass, weed, and tree are displayed in parts per cubic meter. Air quality and UV index are indices and are unitless. May be NULL.
    let value: Int?
    /// Category of the pollution. (low, high, good, moderate, unhealthy, hazardous)
    let category: String
    /// Value associated with the category. These values range from 1 to 6, with 1 implying good conditions and 6 implying hazardous conditions.
    let categoryValue: Int
    /// Only exists for air quality. Examples include ozone and particle pollution.
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case value = "Value"
        case category = "Category"
        case categoryValue = "CategoryValue"
        case type = "Type"
    }
}

/// Day Model
struct DayModel: Codable {
    /// Numeric value representing an icon that matches the forecast.
    let icon: Int
    /// Phrase description of the icon.
    let iconPhrase: String
    /// Local Source Model
    let localSource: LocalSource
    /// Phrase description of the forecast. (AccuWeather attempts to keep this phrase under 30 characters in length, but some languages/weather events may result in a phrase exceeding 30 characters.
    let shortPhrase: String
    /// Phrase description of the forecast. (AccuWeather attempts to keep this phrase under 100 characters in length, but some languages/weather events may result in a phrase exceeding 100 characters.
    let longPhrase: String
    /// Percent representing the probability of precipitation. May be NULL.
    let precipitationProbability: Int?
    /// Percent representing the probability of a thunderstorm. May be NULL.
    let thunderstormProbability: Int?
    /// Percent representing the probability of rain. May be NULL.
    let rainProbability: Int?
    /// Percent representing the probability of snow. May be NULL.
    let snowProbability: Int?
    /// Percent representing the probability of ice. May be NULL.
    let iceProbability: Int?
    /// Wind Model
    let wind: WindModel
    /// Wind Gust Model
    let windGust: WindGustModel
    /// Total Liquit Model
    let totalLiquit: ValueModel
    /// Rain Model
    let rain: ValueModel
    /// Snow Model
    let snow: ValueModel
    /// Ice Model
    let ice: ValueModel
    /// The total number of hours containing any type of precipitation in the indicated 12-hour period.
    let hoursOfPrecipitation: Float
    /// The total number of hours containing rain in the indicated 12-hour period.
    let hoursOfRain: Float
    /// The total number of hours containing snowfall in the indicated 12-hour period.
    let hoursOfSnow: Float
    /// The total number of hours containing ice precipitation in the indicated 12-hour period.
    let hoursOfIce: Float
    /// Percent representing cloud cover.
    let cloudCover: Int
    
    enum CodingKeys: String, CodingKey {
        case icon = "Icon"
        case iconPhrase = "IconPhrase"
        case localSource = "LocalSource"
        case shortPhrase = "ShortPhrase"
        case longPhrase = "LongPhrase"
        case precipitationProbability = "PrecipitationProbability"
        case thunderstormProbability = "ThunderstormProbability"
        case rainProbability = "RainProbability"
        case snowProbability = "SnowProbability"
        case iceProbability = "IceProbability"
        case wind = "Wind"
        case windGust = "WindGust"
        case totalLiquit = "TotalLiquid"
        case rain = "Rain"
        case snow = "Snow"
        case ice = "Ice"
        case hoursOfPrecipitation = "HoursOfPrecipitation"
        case hoursOfRain = "HoursOfRain"
        case hoursOfSnow = "HoursOfSnow"
        case hoursOfIce = "HoursOfIce"
        case cloudCover = "CloudCover"
    }
}

/// Night Model
struct NightModel: Codable {
    /// Numeric value representing an icon that matches the forecast.
    let icon: Int
    /// Phrase description of the icon.
    let iconPhrase: String
    /// Local Source Model
    let localSource: LocalSource
    /// Phrase description of the forecast. (AccuWeather attempts to keep this phrase under 30 characters in length, but some languages/weather events may result in a phrase exceeding 30 characters.
    let shortPhrase: String
    /// Phrase description of the forecast. (AccuWeather attempts to keep this phrase under 100 characters in length, but some languages/weather events may result in a phrase exceeding 100 characters.
    let longPhrase: String
    /// Percent representing the probability of precipitation. May be NULL.
    let precipitationProbability: Int?
    /// Percent representing the probability of a thunderstorm. May be NULL.
    let thunderstormProbability: Int?
    /// Percent representing the probability of rain. May be NULL.
    let rainProbability: Int?
    /// Percent representing the probability of snow. May be NULL.
    let snowProbability: Int?
    /// Percent representing the probability of ice. May be NULL.
    let iceProbability: Int?
    /// Wind Model
    let wind: WindModel
    /// Wind Gust Model
    let windGust: WindGustModel
    /// Total Liquit Model
    let totalLiquit: ValueModel
    /// Rain Model
    let rain: ValueModel
    /// Snow Model
    let snow: ValueModel
    /// Ice Model
    let ice: ValueModel
    /// The total number of hours containing any type of precipitation in the indicated 12-hour period.
    let hoursOfPrecipitation: Float
    /// The total number of hours containing rain in the indicated 12-hour period.
    let hoursOfRain: Float
    /// The total number of hours containing snowfall in the indicated 12-hour period.
    let hoursOfSnow: Float
    /// The total number of hours containing ice precipitation in the indicated 12-hour period.
    let hoursOfIce: Float
    /// Percent representing cloud cover.
    let cloudCover: Int
    
    enum CodingKeys: String, CodingKey {
        case icon = "Icon"
        case iconPhrase = "IconPhrase"
        case localSource = "LocalSource"
        case shortPhrase = "ShortPhrase"
        case longPhrase = "LongPhrase"
        case precipitationProbability = "PrecipitationProbability"
        case thunderstormProbability = "ThunderstormProbability"
        case rainProbability = "RainProbability"
        case snowProbability = "SnowProbability"
        case iceProbability = "IceProbability"
        case wind = "Wind"
        case windGust = "WindGust"
        case totalLiquit = "TotalLiquid"
        case rain = "Rain"
        case snow = "Snow"
        case ice = "Ice"
        case hoursOfPrecipitation = "HoursOfPrecipitation"
        case hoursOfRain = "HoursOfRain"
        case hoursOfSnow = "HoursOfSnow"
        case hoursOfIce = "HoursOfIce"
        case cloudCover = "CloudCover"
    }
}

/// Local Source Model
struct LocalSource: Codable {
    /// Numeric identifier, unique to the local data provider.
    let id: Int
    /// Name of the local data provider. Name is displayed in the language specified by language code in URL, if available. Otherwise, Name is displayed in English or the language in which the name was provided.
    let name: String
    /// Weather code provided by the local data provider. This weather code allows the forecast to be matched to icons provided by the local data provider instead of AccuWeather icons.
    let weatherCode: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case weatherCode = "WeatherCode"
    }
}

/// Wind Model
struct WindModel: Codable {
    /// Speed Model
    let speed: ValueModel
    /// Direction Model
    let direction: Direction
    
    enum CodingKeys: String, CodingKey {
        case speed = "Speed"
        case direction = "Direction"
    }
}

/// Direction Model
struct Direction: Codable {
    /// Wind direction in azimuth degrees (e.g. 180° indicates wind coming from the south).
    let degrees: Double
    /// Direction abbreviation in the specified language.
    let localized: String
    /// Direction abbreviation in English.
    let english: String
    
    enum CodingKeys: String, CodingKey {
        case degrees = "Degrees"
        case localized = "Localized"
        case english = "English"
    }
}

/// WindGust Model
struct WindGustModel: Codable {
    /// Speed Model
    let speed: ValueModel
    
    enum CodingKeys: String, CodingKey {
        case speed = "Speed"
    }
}

/// DailyForecast Model
struct DailyForecastModel: Codable {
    /// Daily Forecast Day Model
    let day: DailyForecastDay
    /// Daily Forecast Night Model
    let night: DailyForecastNight
    
    enum CodingKeys: String, CodingKey {
        case day = "Day"
        case night = "Night"
    }
}

/// DailyForecastDay Model
struct DailyForecastDay: Codable {
    /// Boolean value that indicates the presence of any type of precipitation for a given day. Displays true if precipitation is present.
    let hasPrecipitation: Bool
    /// Indicates if the precipitation strength is light, moderate, or heavy. Only returned if HasPrecipitation is true.
    let precipitationType: String?
    /// Indicates if the precipitation strength is light, moderate, or heavy. Only returned if HasPrecipitation is true.
    let precipitationIntensity: String?
    
    enum CodingKeys: String, CodingKey {
        case hasPrecipitation = "HasPrecipitation"
        case precipitationType = "PrecipitationType"
        case precipitationIntensity = "PrecipitationIntensity"
    }
}

/// DailyForecastNight Model
struct DailyForecastNight: Codable {
    /// Boolean value that indicates the presence of any type of precipitation for a given day. Displays true if precipitation is present.
    let hasPrecipitation: Bool
    /// Indicates if the precipitation strength is light, moderate, or heavy. Only returned if HasPrecipitation is true.
    let precipitationType: String?
    /// Indicates if the precipitation strength is light, moderate, or heavy. Only returned if HasPrecipitation is true.
    let precipitationIntensity: String?
    
    enum CodingKeys: String, CodingKey {
        case hasPrecipitation = "HasPrecipitation"
        case precipitationType = "PrecipitationType"
        case precipitationIntensity = "PrecipitationIntensity"
    }
}
