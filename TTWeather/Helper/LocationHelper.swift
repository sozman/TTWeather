//
//  LocationHelper.swift
//  TTWeather
//
//  Created by Sinan Özman on 13.07.2021.
//

import Foundation
import CoreLocation
import UIKit

class LocationHelper {
    /// Location Manager
    let locationManager: CLLocationManager = CLLocationManager()
    
    /// To be lazily initialized only once, even when accessed across multiple threads simultaneously
    public class var shared: LocationHelper {
        enum Static {
            static let instance = LocationHelper()
        }
        return Static.instance
    }
    
    /// Check Location Permission
    /// - Returns: Authorized is true, not determined is false
    func checkLocationPermission() -> Bool {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                return false
            case .authorizedAlways, .authorizedWhenInUse:
                return true
            @unknown default:
                return false
            }
        } else {
            return false
        }
    }
    
    /// get permission
    func permissionRequest() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}
