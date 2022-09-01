//
//  Container+Coordinators.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Foundation
import Swinject

extension Container {
    
    func registerCoordinators() {
        autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        autoregister(MoviesViewCoordinator.self, initializer: MoviesViewCoordinator.init)
        autoregister(MovieDetailCoordinator.self, initializer: MovieDetailCoordinator.init)
        autoregister(ActorViewCoordinator.self, initializer: ActorViewCoordinator.init)
        autoregister(MainTabBarViewCoordinator.self, initializer: MainTabBarViewCoordinator.init)
    }
}
