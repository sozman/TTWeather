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
            getTextResult()
        }
    }
    
    // MARK: - Output
    /// Observable autocomplete response
    var results: Observable<[AutoCompleteResponse]> = Observable([])
    
    // MARK: - Supported Functions
    
    /// Get Autocomplete responses where is on the API
    private func getTextResult() {
        let request = AutoCompleteRequest(text: self.searchedText ?? "")
        networkClient.executeRequest(
            endpoint: SearchEndpoint.getLocationAutoComplete(request: request),
            model: [AutoCompleteResponse].self) { [weak self] result, error in
            guard let self = self else { return }
            if let result = result {
                self.results = Observable(result)
            } else {
                print(error?.localizedDescription ?? "")
            }
        }
    }
}
