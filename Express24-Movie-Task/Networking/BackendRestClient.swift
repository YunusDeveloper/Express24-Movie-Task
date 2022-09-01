//
//  BackendRestClient.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Foundation
import RxSwift

final class BackendRestClient {
    private let httpClient: HttpClient
    private let alertDispatcher: AlertDispatcher
    
    init(httpClient: HttpClient, alertDispatcher: AlertDispatcher) {
        self.httpClient = httpClient
        self.alertDispatcher = alertDispatcher
    }
    
    func request<T:Codable>(_ request: ApiRequest<T>) -> Single<T>{
    
        print("JSON \(String(describing: request.json?.toString()))")
        
        return Single.create { single in
            self.httpClient.set(headers: self.getHeaders())
            self.httpClient.request(
                resource: "\(Constants.BASE_URL)\(request.resource)",
                method: request.method,
                json: request.json) {
                self.validate(response: $0, for: request, single: single)
            }
            
            return Disposables.create()
        }
    }
    
    private func validate<T:Codable>(response: ApiResponse, for request: ApiRequest<T>, single: Single<T>.SingleObserver) {
        response.print()
        guard response.success && (response.statusCode ?? 0) >= request.expectedCode && (response.statusCode ?? 0) < 300 else {
            let error = ApiError.requestFailed(statusCode: response.statusCode, response: response.data)
            self.dispatch(error: error)
//            single(.error(error))
            single(.failure(error))
            return
        }
        
        guard let parsedResponse = response.data?.toObject(T.self) else {
            let error = ApiError.requestFailed(statusCode: response.statusCode, response: response.data)
            self.dispatch(error: error)
//            single(.error(error))
            single(.failure(error))
            return
        }
        
        single(.success(parsedResponse))
    }
    
    private func getHeaders() -> [String:String] {
        var headers = ["Content-Type": "application/json"]
//        if let tokenHeader = UserDefaults.standard.getToken() {
//            headers["Authorization"] = "Bearer \(tokenHeader)"
//        }
        return headers
    }
    
    private func dispatch(error: ApiError) {
        let message = self.getMessage(error: error)
        self.alertDispatcher.dispatch(error: message)
    }
    
    private func getMessage(error: ApiError) -> AlertMessage {
        let message = "Could not process request."

        let alertMessage = AlertMessage(title: "Xatolik yuzberdi", message: message, buttons: ["OK"], actions: [:])
        return alertMessage
    }
}
