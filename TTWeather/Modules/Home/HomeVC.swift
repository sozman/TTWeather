//
//  HomeVC.swift
//  TTWeather
//
//  Created by Sinan Özman on 15.07.2021.
//

import UIKit
import SnapKit

/// HomeVC
class HomeVC: UIViewController {
    
    // MARK: - Properties
    
    /// View Controllers
    var viewControllers: [WeatherDetailViewController] = []
    
    // MARK: - View Object
    
    /// Pager Controller
    var pageViewController: UIPageViewController = {
       let controller = UIPageViewController(
        transitionStyle: .pageCurl,
        navigationOrientation: .horizontal,
        options: nil)
        return controller
    }()
    
    /// Bottom Page Control Bar
    var pageControl : UIPageControl = UIPageControl()
    
    /// Search Button
    var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(searchButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - View Did Load
    
    /// Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = setupControllers()
        pageViewController.dataSource = self
        pageViewController.delegate = self
        setupLayout()
        setupUI()
    }
    
    /// Notifies the view controller that its view was added to a view hierarchy.
    /// - Parameter animated: animated If true, the view was added to the window using an animation.

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewControllers = setupControllers()
        setupUI()
    }
    
    // MARK: - Setup User Interface
    
    /// Setup Layout
    private func setupLayout() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        view.addSubview(pageControl)
        view.addSubview(searchButton)
        self.pageViewController.didMove(toParent: self)
        
        pageControl.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.equalTo(25)
            make.right.equalTo(-25)
            make.bottom.equalTo(-10)
        }
        pageViewController.view.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(pageControl.snp.bottom)
        }
        
        searchButton.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.top.equalTo(35)
            make.width.height.equalTo(60)
        }
    }

    /// Setup UI
    private func setupUI() {
        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true)
        pageControl.numberOfPages = viewControllers.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.darkGray
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
    }
    
    // MARK: - Supported Functions
    
    /// Setup Weather Detail Controllers
    /// - Returns: WeatherDetailController
    func setupControllers() -> [WeatherDetailViewController] {
        return LocationManager.shared.locations.map { model in
            let controller = WeatherDetailViewController.loadFromNib(nibName: "WeatherDetail")
            controller.model = WeatherDetailModel(cityName: model.cityName, locationKey: model.locationKey)
            return controller
        }
    }
    
    // MARK: - Button Actions
    
    /// Search Button Pressed Action
    /// - Parameter sender: Search Button
    @objc func searchButtonPressed(_ sender: UIButton) {
        SearchViewController.presentController(loadFromNib: true, nibName: "Search") { vc in
            guard let vc = vc as? SearchViewController else { return }
            vc.fromHome = true
            self.present(vc, animated: true)
        }
    }
}

// MARK: - UIPageViewControllerDataSource
extension HomeVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    /// Returns the view controller before the given view controller.
    /// - Parameters:
    ///   - pageViewController: The page view controller
    ///   - viewController: The view controller that the user navigated away from.
    /// - Returns: The view controller before the given view controller, or nil to indicate that there is no previous view controller.
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let viewController = viewController as! WeatherDetailViewController
        if let index = viewControllers.firstIndex(of: viewController) {
            if index > 0 {
                pageControl.currentPage = index - 1
                return viewControllers[index - 1]
            } else {
                return nil
            }
        }

        return nil
    }
    
    /// Returns the view controller after the given view controller.
    /// - Parameters:
    ///   - pageViewController: The page view controller
    ///   - viewController: The view controller that the user navigated away from.
    /// - Returns: The view controller after the given view controller, or nil to indicate that there is no next view controller.
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let viewController = viewController as! WeatherDetailViewController
        if let index = viewControllers.firstIndex(of: viewController) {
            if index < viewControllers.count - 1 {
                pageControl.currentPage = index + 1
                return viewControllers[index + 1]
            } else {
                return nil
            }
        }

        return nil
    }

}


