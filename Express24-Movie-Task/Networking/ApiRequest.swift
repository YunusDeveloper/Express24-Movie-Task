//
//  ApiRequest.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Foundation

class ApiRequest<T:Codable> {
    
    let method: HttpMethod
    let resource: String
    let expectedCode: Int
    let form: [String:String]?
    let json: Data?
    
    init(resource: String,
         method: HttpMethod = .get,
         expectedCode: Int = 200,
         form: [String:String]? = nil,
         json: Data? = nil) {
        
        self.resource = resource
        self.method = method
        self.expectedCode = expectedCode
        self.form = form
        self.json = json
    }
}

enum HttpMethod: String {
    case post = "POST"
    case get = "GET"
    case delete = "DELETE"
    case put = "PUT"
}
