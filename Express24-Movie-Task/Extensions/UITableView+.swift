//
//  UITableView+.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 01/09/22.
//

import UIKit

extension UITableView {
    
    class func makeTableView(style: UITableView.Style = .plain, delegateDataSourece: Any?)-> UITableView {
        let tableView = UITableView(frame: .zero, style: style)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.delegate = delegateDataSourece as? UITableViewDelegate
        tableView.dataSource = delegateDataSourece as? UITableViewDataSource
        if style == .plain {
            tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.01))
        }
        return tableView
    }
}

extension UITableViewCell {
    
    static func makeReuseIdentifier()->String {
        return String(describing: self)
    }
    
    static func register(to tableView: UITableView, reuseIdentifier:String? = nil) {
        tableView.register(self, forCellReuseIdentifier: reuseIdentifier ?? makeReuseIdentifier())
    }
    
    static func dequeue(on tableView: UITableView, at indexPath: IndexPath) -> Self? {
        return tableView.dequeueReusableCell(withIdentifier: makeReuseIdentifier(), for: indexPath) as? Self
    }
    
    static func dequeue(tableView: UITableView) -> Self? {
        return tableView.dequeueReusableCell(withIdentifier: makeReuseIdentifier()) as? Self
    }
}
