//
//  HttpClient.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Foundation

protocol HttpClient {
    
    func set(headers: [String:String])
    
    func request(resource: String, method: HttpMethod, json: Data?,
                 completion: @escaping (ApiResponse) -> Void)
}
