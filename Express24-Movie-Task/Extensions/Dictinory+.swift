//
//  Dictinory+.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import Foundation

extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
