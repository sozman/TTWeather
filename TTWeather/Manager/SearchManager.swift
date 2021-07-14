//
//  SearchManager.swift
//  TTWeather
//
//  Created by Sinan Özman on 12.07.2021.
//

import Foundation

/// Search key for user session
private let userSessionSearchKey = "UserSessionSearchKey"

/// Search Manager
public class SearchManager {
    /// Last 5 Location
    var lastSearchedLocations: [AutoCompleteResponse] = [] {
        didSet {
            if lastSearchedLocations.count == 5 {
                lastSearchedLocations.remove(at: 0)
            }
            save(search: lastSearchedLocations)
        }
    }
    /// To be lazily initialized only once, even when accessed across multiple threads simultaneously
    public class var shared: SearchManager {
        enum Static {
            static let instance = SearchManager()
        }
        return Static.instance
    }
    
    /// Decleration
    init() {
        /// User Session
        let userDefaults = UserDefaults.standard
        // Read Search
        do {
            // Search
            if let search = userDefaults.object(forKey: userSessionSearchKey) as? Data {
                lastSearchedLocations = try JSONDecoder().decode([AutoCompleteResponse].self, from: search)
            }
        } catch let errorMessage {
            print("\(errorMessage.localizedDescription)")
        }
    }
    
    /// Save Search for searchVC
    /// - Parameter value: Auto Complete Response
    private func save(search value: [AutoCompleteResponse]?) {
        // Search variable control
        guard let value = value else {
            print("Search couldn't find")
            return
        }
        // Save Search result on local database
        do {
            UserDefaults.standard.set(try JSONEncoder().encode(value), forKey: userSessionSearchKey)
        } catch let errorMessage {
            print("\(errorMessage.localizedDescription)")
        }
    }
}
