//
//  Container+Services.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    
    func registerServices() {
        self.autoregister(BackendRestClient.self, initializer: BackendRestClient.init).inObjectScope(.container)
        self.autoregister(AlertDispatcher.self, initializer: AlertDispatcher.init).inObjectScope(.container)
        self.autoregister(SessionService.self, initializer: SessionService.init).inObjectScope(.container)
        self.autoregister(HttpClient.self, initializer: MovieHttp.init).inObjectScope(.container)
    }
}
