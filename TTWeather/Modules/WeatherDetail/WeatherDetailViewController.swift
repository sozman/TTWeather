//
//  WeatherDetailViewController.swift
//  TTWeather
//
//  Created by Sinan Özman on 14.07.2021.
//

import UIKit

/// Weather Detail View Controller
class WeatherDetailViewController: BaseVC {
    
    // MARK: - Local Properties
    
    /// Weather Detail View Controller
    fileprivate var viewModel = WeatherDetailViewModel()
    
    /// Weather Detail Model
    var model: WeatherDetailModel?
    
    // MARK: - View Object
    
    /// Table View
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: "TemperatureCell", bundle: nil), forCellReuseIdentifier: "TemperatureCell")
            tableView.register(UINib(nibName: "InformationCell", bundle: nil), forCellReuseIdentifier: "InformationCell")
        }
    }
    
    /// Weather Condition for background effects
    override var weatherCondition: WeatherConditions {
        get {
            return super.weatherCondition
        } set {
            super.weatherCondition = newValue
        }
    }
    
    /// Day time for background image
    override var isDayTime: Bool {
        get {
            return super.isDayTime
        } set {
            super.isDayTime = newValue
        }
    }
    
    // MARK: - View Did Load
    
    /// Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        setupUI()
    }
    
    // MARK: - Integration
    
    /// Binding variables where is on the view model
    private func setupBinding() {
        viewModel.model = self.model
        viewModel.isLoading.bind { _ in
            self.setupUI()
        }
    }
    
    /// Setup UI
    private func setupUI() {
        if !viewModel.isLoading.value {
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension WeatherDetailViewController: UITableViewDataSource {

    /// Tells the data source to return the number of rows in a given section of a table view.
    /// - Parameters:
    ///   - tableView: The table-view object requesting this information.
    ///   - section: An index number identifying a section in tableView.
    /// - Returns: The number of rows in section.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    /// Asks the data source for a cell to insert in a particular location of the table view.
    /// - Parameters:
    ///   - tableView: Asks the data source for a cell to insert in a particular location of the table view.
    ///   - indexPath: An index path locating a row in tableView.
    /// - Returns: An object inheriting from UITableViewCell that the table view can use for the specified row. UIKit raises an assertion if you return nil.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.result.value.first
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "TemperatureCell",
                for: indexPath
            ) as? TemperatureCell else { return UITableViewCell() }
            
            cell.loadView(
                cityName: model?.cityName ?? "",
                weatherStatus: data?.weatherText ?? "",
                icon: data?.weatherIcon,
                temperature: data?.temperature.metric.value,
                maxTemperature: data?.temperatureSummay.past24HourRange.maximum.value,
                minTemperature: data?.temperatureSummay.past24HourRange.minimum.value)
            return cell
        } else if indexPath.row <= 3 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "InformationCell",
                for: indexPath
            ) as? InformationCell else { return UITableViewCell() }
            switch indexPath.row {
            case 1:
                // MARK: - Left Section
                cell.leftSectionTitleLabel.text = "Humidity"
                cell.leftSectionContentLabel.text = "\(data?.relativeHumidity ?? 0)"
                
                // MARK: - Right Section
                cell.rightSectionTitleLabel.text = "Wind"
                let windText = "\(data?.wind.direction.localized ?? "") \(data?.wind.speed.value ?? 0) \(data?.wind.speed.unit ?? "")"
                cell.rightSectionContentLabel.text = windText
            case 2:
                // MARK: - Left Section
                cell.leftSectionTitleLabel.text = "Feel"
                cell.leftSectionContentLabel.text = "\(data?.realFeelTemperature.metric.value ?? 0)°"
                
                // MARK: - Right Section
                cell.rightSectionTitleLabel.text = "Pressure"
                cell.rightSectionContentLabel.text = "\(data?.pressure.metric.value ?? 0.0) \(data?.pressure.metric.unit ?? "")"
            case 3:
                // MARK: - Left Section
                cell.leftSectionTitleLabel.text = "UV Index"
                cell.leftSectionContentLabel.text = data?.uvIndexText ?? ""
                // MARK: - Right Section
                cell.rightSectionTitleLabel.text = "Visibility"
                cell.rightSectionContentLabel.text = "\(data?.visibility.metric.value ?? 0.0) \(data?.visibility.metric.unit ?? "")"
            default:
                break
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

// MARK: - UITableView Delegate
extension WeatherDetailViewController: UITableViewDelegate {
    /// Asks the delegate for the height to use for a row in a specified location.
    /// - Parameters:
    ///   - tableView: The table-view object requesting this information
    ///   - indexPath: An index path that locates a row in tableView.
    /// - Returns: A nonnegative floating-point value that specifies the height (in points) that row should be.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 330
        } else {
            return 70
        }
    }
}
