//
//  Container+ViewModels.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    
    func registerViewModels() {
        autoregister(MoviesViewViewModel.self, initializer: MoviesViewViewModel.init)
        autoregister(MovieDetailViewModel.self, initializer: MovieDetailViewModel.init)
        autoregister(ActorViewModel.self, initializer: ActorViewModel.init)
    }
}
