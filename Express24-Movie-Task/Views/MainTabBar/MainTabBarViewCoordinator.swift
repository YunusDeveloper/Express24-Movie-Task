//
//  MainTabBarViewCoordinator.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Foundation
import RxSwift

final class MainTabBarViewCoordinator: BaseCoordinator {
    private let disposeBag = DisposeBag()
    
    override func start() {
        removeRootsInnerCoordinators()
        var viewControllers = [UINavigationController]()
        let tabBarViewController = MainTabBarView()
        
        let popularView = AppDelegate.container.resolve(MoviesViewCoordinator.self)
        popularView?.navigationController = createNavController(title: "Popular", image: UIImage(named: "popular_unselected")!, selectedImage: UIImage(named: "popular")!)
        popularView?.loadPopularMovies()
        popularView?.setNavTitle("Popular")
        startCoordinator(coordinator: popularView)
        viewControllers += [popularView!.navigationController]
        
        let topRatedView = AppDelegate.container.resolve(MoviesViewCoordinator.self)
        topRatedView?.navigationController = createNavController(title: "Top Rated", image: UIImage(named: "topRated_unselected")!, selectedImage: UIImage(named: "topRated")!)
        topRatedView?.loadToprated()
        topRatedView?.setNavTitle("Top Rated")
        startCoordinator(coordinator: topRatedView)
        viewControllers += [topRatedView!.navigationController]
        
        let upcomingView = AppDelegate.container.resolve(MoviesViewCoordinator.self)
        upcomingView?.navigationController = createNavController(title: "Upcoming", image: UIImage(named: "upcoming_unselected")!, selectedImage: UIImage(named: "upcoming")!)
        upcomingView?.loadUpcomingMovies()
        upcomingView?.setNavTitle("Upcoming")
        startCoordinator(coordinator: upcomingView)
        viewControllers += [upcomingView!.navigationController]
        
        tabBarViewController.setViewControllers(viewControllers, animated: false)
        
        navigationController.viewControllers = [tabBarViewController]
        navigationController.isNavigationBarHidden = true
    }
    
    
    private final func startCoordinator(coordinator: BaseCoordinator?) {
        guard let childCoordinator = coordinator else {
            return
        }
        start(coordinator: childCoordinator)
    }
    
    private func removeRootsInnerCoordinators() {
        childCoordinators.forEach { (coordinator) in
            coordinator.removeChildCoordinators()
        }
    }
    
    fileprivate func createNavController(title: String,
                                         image: UIImage,
                                         selectedImage: UIImage) -> UINavigationController {
        let navController = UINavigationController()
        let tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        navController.tabBarItem = tabBarItem
        return navController
    }
}
