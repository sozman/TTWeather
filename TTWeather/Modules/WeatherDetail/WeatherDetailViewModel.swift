//
//  WetherDetailViewModel.swift
//  TTWeather
//
//  Created by Sinan Özman on 15.07.2021.
//

import Foundation

class WeatherDetailViewModel {
    
    var dummyData: [CurrentResponse] = []
    
    init() {
        setupJSON()
    }
    
    func setupJSON() {
        let jsonData = readLocalJSONFile(forName: "test")
        if let data = jsonData {
            do {
                    let decodedData = try JSONDecoder().decode([CurrentResponse].self, from: data)
                    print(decodedData)
                dummyData = decodedData
                } catch {
                    print("error: \(error)")
                }
        }
    }
    
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
