//
//  SettingsViewController.swift
//  TTWeather
//
//  Created by Sinan Özman on 16.07.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    // MARK: - Properties
    
    /// Home VC Delegate
    weak var delegate: HomeVCDelegate?
    
    /// TableView
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    /// Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    /// Notifies the view controller that its view was removed from a view hierarchy.
    /// - Parameter animated: If true, the disappearance of the view was animated.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate?.refreshPage()
    }
    
    /// Setup UI
    private func setupUI() {
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    /// Tells the data source to return the number of rows in a given section of a table view.
    /// - Parameters:
    ///   - tableView: The table-view object requesting this information.
    ///   - section: An index number identifying a section in tableView.
    /// - Returns: The number of rows in section.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocationManager.shared.locations.count
    }
    
    /// Asks the data source for a cell to insert in a particular location of the table view.
    /// - Parameters:
    ///   - tableView: Asks the data source for a cell to insert in a particular location of the table view.
    ///   - indexPath: An index path locating a row in tableView.
    /// - Returns: An object inheriting from UITableViewCell that the table view can use for the specified row. UIKit raises an assertion if you return nil.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = LocationManager.shared.locations[indexPath.row].cityName
        return cell
    }
}

// MARK: - UITableView Delegate
extension SettingsViewController: UITableViewDelegate {
    /// Asks the delegate for the height to use for a row in a specified location.
    /// - Parameters:
    ///   - tableView: The table-view object requesting this information
    ///   - indexPath: An index path that locates a row in tableView.
    /// - Returns: A nonnegative floating-point value that specifies the height (in points) that row should be.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    /// Asks the data source to verify that the given row is editable.
    /// - Parameters:
    ///   - tableView: The table-view object requesting this information.
    ///   - indexPath: An index path locating a row in tableView.
    /// - Returns: true if the row indicated by indexPath is editable; otherwise, false.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /// Asks the data source to commit the insertion or deletion of a specified row in the receiver.
    /// - Parameters:
    ///   - tableView: The table-view object requesting the insertion or deletion.
    ///   - editingStyle: The cell editing style corresponding to a insertion or deletion requested for the row specified by indexPath. Possible editing styles are UITableViewCell.EditingStyle.insert or UITableViewCell.EditingStyle.delete.
    ///   - indexPath: An index path locating the row in tableView.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            LocationManager.shared.locations.remove(at: indexPath.row)
            setupUI()
        }
    }
}
