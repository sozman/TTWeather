//
//  TemperatureCell.swift
//  TTWeather
//
//  Created by Sinan Özman on 15.07.2021.
//

import UIKit

/// Temperature Cell
class TemperatureCell: UITableViewCell {

    /// City Name Label
    @IBOutlet weak var cityNameLabel: UILabel!
    /// Current Weather Status Label
    @IBOutlet weak var currentWeatherStatusLabel: UILabel!
    
    // TODO: IconImageView will be made in
    /// Icon Image View
    @IBOutlet weak var iconImageView: UIImageView!
    /// Temperature Label
    @IBOutlet weak var temperatureLabel: UILabel!
    /// General Temperature Label
    @IBOutlet weak var generalTemperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Load Cell View with parameter
    /// - Parameters:
    ///   - cityName: Current Location City Name
    ///   - weatherStatus: Weather Status like sunny
    ///   - icon: Weather Status Icon
    ///   - temperature: Current Temperature
    ///   - maxTemperature: Maximum temperature of day
    ///   - minTemperature: Minimum temperature of day
    func loadView(
        cityName: String,
        weatherStatus: String,
        icon: Int?,
        temperature: Double?,
        maxTemperature: Double?,
        minTemperature: Double?
    ) {
        self.cityNameLabel.text = cityName
        self.currentWeatherStatusLabel.text = weatherStatus
        // TODO: Image View
        let temperature = temperature ?? 0.0
        self.temperatureLabel.text = "\(temperature)"
        let generalTemperature = "Max: \(maxTemperature ?? temperature)° Min: \(String(describing: minTemperature ?? temperature))°"
        self.generalTemperatureLabel.text = generalTemperature
    }
}
