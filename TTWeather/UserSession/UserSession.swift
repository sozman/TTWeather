//
//  UserSession.swift
//  TTWeather
//
//  Created by Sinan Özman on 13.07.2021.
//

import Foundation

/// Is application first time opened user session key
private let userSessionFirstTutorialFormKey = "UserSessionFirstTutorialFormKey"

// MARK: - User Session

class UserSession {
    /// Is application first time opened
    var firstTutorial: Bool?
    /// static type property, which is guaranteed to be lazily initialized only once, even when accessed across multiple threads simultaneously
    class var shared: UserSession {
        enum Static {
            static let instance = UserSession()
        }
        return Static.instance
    }
    
    /// Decleration
    init() {
        /// Local database default key
        let userDefaults = UserDefaults.standard
        // Read all data where is on the local database
        do {
            // First tutorial reader
            if let data = userDefaults.object(forKey: userSessionFirstTutorialFormKey) as? Data {
                firstTutorial = try JSONDecoder().decode(Bool.self, from: data)
            }
        } catch let errorMessage {
            print("\(errorMessage.localizedDescription)")
        }
    }
    
    /// Save first tutorial status
    /// - Parameter value: first tutorial status
    func save(firstTutorial value: Bool?) {
        // Tutorial variable control
        guard let value = value else {
            print("First tutorial status type is not Bool")
            return
        }
        // Save first tutorial status self variable
        firstTutorial = value
        // Save first tutorial on local database
        do {
            UserDefaults.standard.set(try JSONEncoder().encode(value), forKey: userSessionFirstTutorialFormKey)
        } catch let errorMessage {
            print("\(errorMessage.localizedDescription)")
        }
    }
}
