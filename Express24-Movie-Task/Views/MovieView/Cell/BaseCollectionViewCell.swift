//
//  BaseCollectionViewCell.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import UIKit


class BaseCollectionViewCell: UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureAndLayoutSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureAndLayoutSubviews()
    }
    
    func configureAndLayoutSubviews() -> Void {
        
    }
}

extension UICollectionViewCell {
    
    static func makeReuseIdentifier()->String {
        return String(describing: self)
    }
    
    static func register(to collectionView: UICollectionView, reuseIdentifier:String? = nil) {
        collectionView.register(self, forCellWithReuseIdentifier: reuseIdentifier ?? makeReuseIdentifier())
    }
    
    static func dequeue(on collectionView: UICollectionView, at indexPath: IndexPath) -> Self? {
        return collectionView.dequeueReusableCell(withReuseIdentifier: makeReuseIdentifier(), for: indexPath) as? Self
    }
}
