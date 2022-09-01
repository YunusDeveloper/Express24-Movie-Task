//
//  AppCoordinator.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Foundation
import RxSwift

final class AppCoordinator: BaseCoordinator {
    private let disposeBag = DisposeBag()
    private let sessionService: SessionService
    private var window: UIWindow?
    
    init(sessionService: SessionService) {
        self.sessionService = sessionService
    }
    
    override func start() {
        self.window?.makeKeyAndVisible()
        
        self.removeChildCoordinators()

        let coordinator = AppDelegate.container.resolve(MainTabBarViewCoordinator.self)!
        self.start(coordinator: coordinator)

        self.window?.rootViewController = coordinator.navigationController
        self.window?.makeKeyAndVisible()
    }
    
    func setWindow(window: UIWindow?) {
        self.window = window
    }
}
