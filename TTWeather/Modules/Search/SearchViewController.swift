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
    
    // MARK: - View Did Load
    
    /// Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        viewModel.searchedText = "ist"
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
        print(viewModel.results)
    }
}
