//
//  ApiResponse.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Foundation

struct VoidResponse: Codable { }

struct ApiResponse {
    let success: Bool
    let statusCode: Int?
    
    let requestUrl: String
    let method: HttpMethod
    
    let data: Data?
    let error: Error?
    
    init(success: Bool, statusCode: Int?, requestUrl: String, method: HttpMethod, data: Data?, error: Error?) {
        self.success = success
        self.statusCode = statusCode
        self.requestUrl = requestUrl
        self.method = method
        self.data = data
        self.error = error
    }
}

extension ApiResponse {
    func print() {
        let responseJson = self.data != nil ? String(data: self.data!, encoding: .utf8) ?? "" : ""
        
        var message = "response: \(self.method) \(self.requestUrl) (status: \(self.statusCode ?? -1))"
        if responseJson.count > 0 {
            message.append("\n\n\(responseJson.prefix(1000))\n")
        }
    }
}
