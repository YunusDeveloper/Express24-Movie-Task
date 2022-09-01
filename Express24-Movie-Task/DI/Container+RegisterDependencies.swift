//
//  Container+RegisterDependencies.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Swinject

extension Container {
    
    func registerDependencies() {
        self.registerServices()
        self.registerCoordinators()
        self.registerViewModels()
    }
}
