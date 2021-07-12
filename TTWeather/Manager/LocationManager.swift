//
//  LocationManager.swift
//  TTWeather
//
//  Created by Sinan Özman on 12.07.2021.
//

import Foundation

/// Location Manager for Pager View
public class LocationManager {
    /// Locations' Keys
    public var locations: [String] = []
    
    /// To be lazily initialized only once, even when accessed across multiple threads simultaneously
    public class var shared: LocationManager {
        enum Static {
            static let instance = LocationManager()
        }
        return Static.instance
    }
}