//
//  SearchViewController.swift
//  TTWeather
//
//  Created by Sinan Özman on 14.07.2021.
//

import UIKit

/// View Controller for search location
class SearchViewController: UIViewController {
    
    // MARK: - Local Properties
    
    /// Search View Model
    fileprivate var viewModel = SearchViewModel()
    
    /// Home View Controller Delegate
    weak var delegate: HomeVCDelegate?
    
    /// Search from home VC
    public var fromHome: Bool = false
    
    // MARK: - View Object
    
    /// Stack View For header search bar
    @IBOutlet private weak var searchBarStackView: UIStackView! {
        didSet {
            searchBarStackView.layer.cornerRadius = 10
            searchBarStackView.layer.borderWidth = 0.7
            searchBarStackView.layer.borderColor = UIColor.black.withAlphaComponent(0.6).cgColor
        }
    }
    
    /// Search Text Field
    @IBOutlet private weak var searchTextField: UITextField! {
        didSet {
            searchTextField.delegate = self
            searchTextField.borderStyle = .none
        }
    }
    
    /// TableView for results
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    // MARK: - View Did Load
    
    /// Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupBinding()
    }
    
    // MARK: - View Did Disappear
    
    /// Notifies the view controller that its view was removed from a view hierarchy.
    /// - Parameter animated: If true, the disappearance of the view was animated.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate?.refreshPage()
    }
    
    // MARK: - Integration
    
    /// Binding variables where is on the view model
    private func setupBinding() {
        viewModel.results.bind { _ in
            self.setupUI()
        }
    }
    
    /// Setup UI
    private func setupUI() {
        self.tableView.reloadData()
    }
    
    /// Register Cells
    private func registerCell() {
        tableView.register(UINib(nibName: "LocationCell", bundle: nil), forCellReuseIdentifier: "LocationCell")
    }
    
    // MARK: - View Actions
    
    /// Clear text where is on the search bar
    /// - Parameter sender: Clear Button
    @IBAction private func clearText(_ sender: UIButton) {
        searchTextField.text = ""
    }
    
    /// Focus on the search bar
    /// - Parameter sender: Tap Gesture
    @IBAction private func focusSearch(_ sender: Any) {
        searchTextField.becomeFirstResponder()
    }
    
    // MARK: - Supported Functions
    
    /// Save Location on the user session
    /// - Parameter location: GeopositionResponse
    private func saveLocation(location: GeopositionResponse) {
        let detail = WeatherDetailModel(cityName: location.localizedName, locationKey: location.key)
        if ((!LocationManager.shared.locations.isEmpty) && (self.fromHome)) {
            LocationManager.shared.locations.append(detail)
        } else if ((!self.fromHome) && LocationManager.shared.locations.isEmpty) {
            LocationManager.shared.locations.append(detail)
            rotate()
        }
    }
    
    /// Save Location on the user session
    /// - Parameter locationSearch: AutoComplete Response
    private func saveLocation(locationSearch: AutoCompleteResponse) {
        SearchManager.shared.lastSearchedLocations.append(locationSearch)
        let detail = WeatherDetailModel(cityName: locationSearch.localizedName, locationKey: locationSearch.key)
        LocationManager.shared.locations.append(detail)
        rotate()
    }
    
    /// Rotate View Controller
    private func rotate() {
        if self.fromHome {
            self.dismiss(animated: true, completion: nil)
        } else {
            HomeVC.presentSelf()
        }
    }
}

// MARK: - UITextField Delegate
extension SearchViewController: UITextFieldDelegate {
    /// Tells the delegate when the text selection changes in the specified text field.
    /// - Parameter textField: UITextField
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.viewModel.searchedText = textField.text
    }
}

// MARK: - UITableView DataSource
extension SearchViewController: UITableViewDataSource {

    /// Tells the data source to return the number of rows in a given section of a table view.
    /// - Parameters:
    ///   - tableView: The table-view object requesting this information.
    ///   - section: An index number identifying a section in tableView.
    /// - Returns: The number of rows in section.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            guard viewModel.yourLocation.value != nil else { return 0 }
            return 1
        case 1:
            return viewModel.lastSearch.value.count
        case 2:
            return viewModel.results.value.count
        default:
            return 0
        }
    }
    
    /// Asks the data source for a cell to insert in a particular location of the table view.
    /// - Parameters:
    ///   - tableView: A table-view object requesting the cell.
    ///   - indexPath: An index path locating a row in tableView.
    /// - Returns: An object inheriting from UITableViewCell that the table view can use for the specified row. UIKit raises an assertion if you return nil.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "LocationCell",
                for: indexPath
            ) as? LocationCell else { return UITableViewCell() }
            switch indexPath.section {
            case 0:
                cell.locationType = .currentLocation
                cell.locationNameLabel.text = viewModel.yourLocation.value?.localizedName
            case 1:
                cell.locationType = .savedLocation
                cell.locationNameLabel.text = SearchManager.shared.lastSearchedLocations[indexPath.row].localizedName
            case 2:
                cell.locationType = .findLocation
                cell.locationNameLabel.text = viewModel.results.value[indexPath.row].localizedName
            default:
                break
            }
            return cell
    }
    
    /// Asks the data source to return the number of sections in the table view.
    /// - Parameter tableView: An object representing the table view requesting this information.
    /// - Returns: The number of sections in tableView.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    /// Asks the delegate for a view to display in the header of the specified section of the table view.
    /// - Parameters:
    ///   - tableView: The table view asking for the view.
    ///   - section: The index number of the section containing the header view.
    /// - Returns: A UILabel, UIImageView, or custom view to display at the top of the specified section.
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        /// Sections Header Text
        let labelText: String? = {
            switch section {
            case 0:
                return "Your Location"
            case 1:
                return "Last Searched Location"
            case 2:
                return "Find Location"
            default:
                return nil
            }
        }()
        
        /// Header View
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = UIColor.lightGray
        
        /// Header Label
        let label = UILabel()
        label.frame = CGRect.init(x: 25, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-25)
        label.text = labelText
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        
        headerView.addSubview(label)
        
        return headerView
    }
}

// MARK: - UITableView Delegate
extension SearchViewController: UITableViewDelegate {

    /// Asks the delegate for the height to use for the header of a particular section.
    /// - Parameters:
    ///   - tableView: The table view requesting this information.
    ///   - section: An index number identifying a section of tableView .
    /// - Returns: A nonnegative floating-point value that specifies the height (in points) of the header for section.
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            if self.viewModel.yourLocation.value == nil {
                return 0
            } else {
                return 30
            }
        case 1:
            if self.viewModel.lastSearch.value.isEmpty {
                return 0
            } else {
                return 30
            }
        case 2:
            if self.viewModel.results.value.isEmpty {
                return 0
            } else {
                return 30
            }
        default:
            return 0
        }
    }
    
    /// Asks the delegate for the height to use for a row in a specified location.
    /// - Parameters:
    ///   - tableView: The table view requesting this information.
    ///   - indexPath: An index path that locates a row in tableView.
    /// - Returns: A nonnegative floating-point value that specifies the height (in points) that row should be.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    /// Tells the delegate a row is selected.
    /// - Parameters:
    ///   - tableView: A table view informing the delegate about the new row selection.
    ///   - indexPath: An index path locating the new selected row in tableView.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            guard let location = viewModel.yourLocation.value else { return }
            self.saveLocation(location: location)
        case 2:
            let location = viewModel.results.value[indexPath.row]
            self.saveLocation(locationSearch: location)
        default:
            break
        }
    }
}
