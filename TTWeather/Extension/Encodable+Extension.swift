//
//  Encodable+Extension.swift
//  TTWeather
//
//  Created by Sinan Özman on 12.07.2021.
//

import Foundation

extension Encodable {
    /// Codable to dictionary for Alamofire Parameter
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        var array =  (try? JSONSerialization.jsonObject(with: data, options: .allowFragments))
            .flatMap {
                $0 as? [String: Any]
            }
        array?["apikey"] = Config.ApiKey
        return array
    }
}
