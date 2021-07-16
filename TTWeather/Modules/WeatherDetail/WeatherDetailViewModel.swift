//
//  WetherDetailViewModel.swift
//  TTWeather
//
//  Created by Sinan Özman on 15.07.2021.
//

import Foundation

class WeatherDetailViewModel {
    // MARK: - Local Properties
    
    /// Network Request Maker
    private let networkClient = NetworkClient()
    
    // MARK: - Input
    /// Weather Detail Model
    var model: WeatherDetailModel? {
        didSet {
            DispatchQueue.main.async {
                self.getResult()
            }
        }
    }
    
    // MARK: - Output
    /// Is Loading
    var isLoading: Observable<Bool> = Observable(true)
    /// Result
    var result: Observable<[CurrentResponse]> = Observable([])
    
    // MARK: - Supported Functions
    
    /// Get Result Current Weather Detail
    private func getResult() {
        let request = CurrentRequest()
        networkClient.executeRequest(
            endpoint: CurrentEndpoint.getCurrent(request: request, locationKey: model?.locationKey),
            model: [CurrentResponse].self) {[weak self] result, error in
            guard let self = self else { return }
            if let result = result {
                self.result.value = result
            } else {
                print(error?.localizedDescription ?? "")
            }
            self.isLoading.value = false
        }
    }
}
