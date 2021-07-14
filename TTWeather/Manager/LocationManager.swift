//
//  LocationManager.swift
//  TTWeather
//
//  Created by Sinan Özman on 12.07.2021.
//

import Foundation

/// Location key for user session
private let userSessionLocationKey = "UserSessionLocationKey"

/// Location Manager for Pager View
public class LocationManager {
    /// Locations' Keys
    public var locations: [String] = [] {
        didSet {
            self.save(location: locations)
        }
    }
    
    /// To be lazily initialized only once, even when accessed across multiple threads simultaneously
    public class var shared: LocationManager {
        enum Static {
            static let instance = LocationManager()
        }
        return Static.instance
    }
    
    /// Decleration
    init() {
        /// User Session
        let userDefaults = UserDefaults.standard
        // Read Location
        do {
            // Location
            if let location = userDefaults.object(forKey: userSessionLocationKey) as? Data {
                locations = try JSONDecoder().decode([String].self, from: location)
            }
        } catch let errorMessage {
            print("\(errorMessage.localizedDescription)")
        }
    }
    
    /// Save location for homeVC
    /// - Parameter value: Locations key Array
    private func save(location value: [String]?) {
        // location variable control
        guard let value = value else {
            print("location couldn't find")
            return
        }
        // Save location on local database
        do {
            UserDefaults.standard.set(try JSONEncoder().encode(value), forKey: userSessionLocationKey)
        } catch let errorMessage {
            print("\(errorMessage.localizedDescription)")
        }
    }
}
