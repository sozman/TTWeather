//
//  SearchViewModel.swift
//  TTWeather
//
//  Created by Sinan Özman on 14.07.2021.
//

import Foundation

/// Search View Model
class SearchViewModel {
    // MARK: - Local Properties
    
    /// Network Request Maker
    private let networkClient = NetworkClient()
    
    // MARK: - Input
    /// Location Text where is on the search bar
    var searchedText: String? {
        didSet {
            DispatchQueue.main.async {
                self.getTextResult()
            }
        }
    }
    
    // MARK: - Output
    /// Observable autocomplete response
    var results: Observable<[AutoCompleteResponse]> = Observable([])
    /// Your Location
    var yourLocation: Observable<GeopositionResponse?> = Observable(nil)
    /// Last Search
    var lastSearch: Observable<[AutoCompleteResponse]> = Observable([])
    
    // MARK: - Decleration
    init() {
        /// Current Location coordinate
        let currentLocation = LocationHelper.shared.getLocation()
        getGeoResult(longitude: "\(currentLocation?.latitude ?? 0)", latitude: "\(currentLocation?.longitude ?? 0)")
        lastSearch.value = SearchManager.shared.lastSearchedLocations
    }
    
    // MARK: - Supported Functions
    
    /// Get Autocomplete responses where is on the API
    private func getTextResult() {
        let request = AutoCompleteRequest(text: self.searchedText ?? "")
        networkClient.executeRequest(
            endpoint: SearchEndpoint.getLocationAutoComplete(request: request),
            model: [AutoCompleteResponse].self) { [weak self] result, error in
            guard let self = self else { return }
            if let result = result {
                self.results.value = result
            } else {
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
    /// Get Geo Location responses where is on the API
    private func getGeoResult(longitude: String, latitude: String) {
        let request = GeopositionRequest(
            geo: GeoText(latitude: latitude, longitude: longitude),
            language: "en-us",
            details: false,
            toplevel: false)
        networkClient.executeRequest(
            endpoint: SearchEndpoint.getLocationWithGeo(request: request),
            model: GeopositionResponse.self) { [weak self]  result, error in
            guard let self = self else { return }
            if let result = result {
                self.yourLocation.value = result
            } else {
                print(error?.localizedDescription ?? "")
            }
        }
    }
}
