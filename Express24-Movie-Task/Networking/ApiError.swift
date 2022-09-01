//
//  ApiError.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Foundation

enum ApiError: Error {
    case requestFailed(statusCode: Int?, response: Data?)
}
