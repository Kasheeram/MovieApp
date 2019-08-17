//
//  MovieListCell.swift
//  MovieApp
//
//  Created by Kashee ram on 8/16/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import UIKit
import SDWebImage


class CardView: UIView {
    
    var cornerRadius: CGFloat = 5
    var shadowOffSetWidth: CGFloat = 0
    var shadowOffSetHeight: CGFloat = 2.0
    var shadowColor: UIColor = UIColor.lightGray
    var shadowRadius : CGFloat = 4.0
    var shadowOpacity: CGFloat = 0.5
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = Float(shadowOpacity)
    }
}

class MovieListCell: UICollectionViewCell {
    
    lazy var cardView:CardView = {
        let view = CardView()
        view.backgroundColor = Colors.cardViewBGR
        return view
    }()
    
    lazy var titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Mission Mungal"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var posterImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "ghost"))
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var votingAvgImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "like"))
//        image.contentMode = .scaleToFit
        return image
    }()
    
    lazy var ratingScoreLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "86%"
        label.numberOfLines = 0
        return label
    }()
    
    
    var movie: Result? {
        didSet {
            if let movie = movie{
                titleLable.text = movie.title
                if let posterPath = movie.posterPath {
                    let img = imageBaseUrl + posterPath
                    posterImage.sd_setImage(with: URL(string: img), completed: nil)
                }
                let votePercet = Int(movie.voteAverage!/10 * 100)
                ratingScoreLable.text = "\(votePercet)%"
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = Colors.cardCellBGR
        addSubview(cardView)
        cardView.addSubview(titleLable)
        cardView.addSubview(posterImage)
        cardView.addSubview(votingAvgImage)
        cardView.addSubview(ratingScoreLable)
        
        cardView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 5, left: 15, bottom: 5, right: 15))
        
        titleLable.anchor(top: cardView.topAnchor, leading: cardView.leadingAnchor, bottom: nil, trailing: cardView.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 10), size: .init(width: 0, height: 40))
        
        votingAvgImage.anchor(top: nil, leading: titleLable.leadingAnchor, bottom: cardView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 10, right: 0),size: .init(width: 30, height: 30))
        
        posterImage.anchor(top: titleLable.bottomAnchor, leading: cardView.leadingAnchor, bottom: votingAvgImage.topAnchor, trailing: cardView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 10, right: 0))
        
        ratingScoreLable.anchor(top: votingAvgImage.topAnchor, leading: votingAvgImage.trailingAnchor, bottom: votingAvgImage.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 8, bottom: 0, right: 0), size: .init(width: 150, height: 0))
    }
}
