//
//  MovieHttp.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Foundation
import Alamofire

final class MovieHttp: HttpClient {
    let session = Alamofire.Session(
        configuration: URLSessionConfiguration.default
    )
    
    var headers:[String : String]? = nil
                
    func set(headers: [String : String]) {
        self.headers = headers
    }
    
    private func getHeaders() -> [String:String] {
        let headers = ["Content-Type": "application/json", "Accept": "application/json"]
        return headers
    }
    
    func request(resource: String,
                 method: HttpMethod, json: Data?,
                 completion: @escaping (ApiResponse) -> Void) {
        print("---------> \(resource)")
        
        guard let urlString = resource.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        var request = URLRequest(url: URL(string: "\(urlString)")!)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = addHeaders()
        request.httpBody = json
        
        session
            .request(request)
            .validate(contentType: ["application/json"])
            .responseString(completionHandler: {[weak self] data in
            guard let self = self else { return }
            
            switch data.result {
                case .success(let value):
                    let resp = self.getResponse(data.response?.statusCode ?? 404, resource, method, value, nil)
                    completion(resp)
                    break
                case .failure(let error):
                let resp = self.getResponse(data.response?.statusCode ?? 404, resource, method, String(decoding: data.data ?? Data(), as: UTF8.self), error)
                    completion(resp)
                    break
            }
        })
    }
    
    func addHeaders() -> [String: String] {
        var additionalHeaders = ["Accept": "application/json"]
        if let headers = headers {
            additionalHeaders.merge(dict: headers)
        }
        
//        if let tokenHeader = UserDefaults.standard.getToken() {
//            let tokenHeader = ["Authorization": "Bearer \(tokenHeader)"]
//            additionalHeaders.merge(dict: tokenHeader)
//        }
       return additionalHeaders
    }
    
    func cancelAllRequests() {
        session.cancelAllRequests()
        AF.cancelAllRequests()
    }
    
    private func getResponse(_ code: Int, _ resource: String, _ method: HttpMethod, _ data: String?, _ error: Error?) -> ApiResponse {
        return ApiResponse(
            success: (200..<300).contains(code),
            statusCode: code,
            requestUrl: resource,
            method: method,
            data: data?.data(using: .utf8),
            error: error
        )
    }
}
