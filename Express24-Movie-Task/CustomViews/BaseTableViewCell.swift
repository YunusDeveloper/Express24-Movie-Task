//
//  BaseTableViewCell.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 01/09/22.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureAndLayoutSubviews()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAndLayoutSubviews()
    }
    
    func configureAndLayoutSubviews() -> Void {
        
    }
    
    func hideSeparator() {
        separatorInset = .init(top: 0, left: 2000, bottom: 0, right: 0)
    }
}
