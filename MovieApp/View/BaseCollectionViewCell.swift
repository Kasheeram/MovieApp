//
//  BaseCollectionViewCell.swift
//  MovieApp
//
//  Created by Kashee ram on 8/17/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import UIKit

class CollectionBaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
