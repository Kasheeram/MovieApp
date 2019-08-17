//
//  MovieDetailsController.swift
//  MovieApp
//
//  Created by Kashee ram on 8/17/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import UIKit

class MovieDetailsController: UIViewController {

    let scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        return scroll
    }()
    
    let contentView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var posterImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.isUserInteractionEnabled = true
        return image
    }()
    
    let backButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backArrow"), for: .normal)
        button.addTarget(self, action: #selector(MovieDetailsController.closeThisView), for: .touchUpInside)
        return button
    }()

    lazy var titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplaySemibold(ofSize: 24)
        label.text = "Mission Mungal"
        label.textColor = Colors.headerRGB
        label.numberOfLines = 0
        return label
    }()
    
    lazy var votingAvgImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "like"))
        //        image.contentMode = .scaleToFit
        return image
    }()
    
    lazy var ratingScoreLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplayRegular(ofSize: 20)
        label.textColor = Colors.titleRGB
        label.text = "86%"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.opacity = 0.5
        return view
    }()
    
    
    lazy var releaseDateTxtLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplayRegular(ofSize: 20)
        label.textColor = Colors.headerRGB
        label.text = "Release Date"
        return label
    }()
    
    lazy var runTimeTxtLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplayRegular(ofSize: 20)
        label.textColor = Colors.headerRGB
        label.text = "Run Time"
        return label
    }()
    
    lazy var languageTxtLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplayRegular(ofSize: 20)
        label.textColor = Colors.headerRGB
        label.text = "Language"
        return label
    }()
    
    lazy var genreTxtLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplayRegular(ofSize: 20)
        label.textColor = Colors.headerRGB
        label.text = "Genre"
        return label
    }()
    
    lazy var numberOfVotesTxtLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplayRegular(ofSize: 20)
        label.textColor = Colors.headerRGB
        label.text = "Total Votes"
        return label
    }()
    
    lazy var actorsTxtLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplayRegular(ofSize: 20)
        label.textColor = Colors.headerRGB
        label.text = "Actor/actress"
        return label
    }()
    
    lazy var releaseDateLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplayRegular(ofSize: 20)
        label.textColor = Colors.titleRGB
        label.text = "Release Date"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var runTimeLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplayRegular(ofSize: 20)
        label.textColor = Colors.titleRGB
        label.text = "Run Time"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var languageLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplayRegular(ofSize: 20)
        label.textColor = Colors.titleRGB
        label.text = "Language"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var genreLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplayRegular(ofSize: 20)
        label.textColor = Colors.titleRGB
        label.text = "Genre"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var numberOfVotesLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplayRegular(ofSize: 20)
        label.textColor = Colors.titleRGB
        label.text = "Total Votes"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var actorsLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplayRegular(ofSize: 20)
        label.textColor = Colors.titleRGB
        label.text = "Actor/actress khjfds dskjhf fdskfj fsdkf fdskfjk fdskj fdskfj dskfj fsdkfjf lkjdsf fsdkj fdklj fdklj fdslkj fdlkfj fsdlj fdl fdslfk fdlfjk fdskj fdslsjdf sdkjf"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var synopsisTxtLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplayRegular(ofSize: 20)
        label.textColor = Colors.headerRGB
        label.text = "Synopsis"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var synopsisLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.sfDisplayRegular(ofSize: 16)
        label.textColor = Colors.titleRGB
        label.text = "Synopsis kdjs fdslkfj fdslkf fsdlfkj fdsl fdgm,n fgdfmg dfkg ertr rtlyk bfgjl vcblkj bcvbkj bvlbjk bcvlbjkbcvlgfdj gtrpoyi tryo gflkfj ghgfl bfglkj fdlfkj dfglj fdglkdj fgdlkj Actor/actress khjfds dskjhf fdskfj fsdkf fdskfjk fdskj fdskfj dskfj fsdkfjf lkjdsf fsdkj fdklj fdklj fdslkj fdlkfj fsdlj fdl fdslfk fdlfjk fdskj fdslsjdf sdkjf"
        label.numberOfLines = 0
        return label
    }()

    
    var movieId:Int?
    var movieDetails:MovieDetails? {
        didSet {
            if let movieDetails = movieDetails {
                let imageUrl = imageBaseUrl + movieDetails.posterPath
                posterImage.sd_setImage(with: URL(string: imageUrl), completed: nil)
                titleLable.text = movieDetails.originalTitle
                releaseDateLable.text = movieDetails.releaseDate
                runTimeLable.text = "\(Double(movieDetails.runtime / 60))"
                let genres = movieDetails.genres
                var gens = ""
                for gen in genres {
                    if gens == "" {
                        gens = gen.name
                    } else {
                       gens += ", \(gen.name)"
                    }
                }
                genreLable.text = gens
                languageLable.text = movieDetails.originalLanguage
                ratingScoreLable.text = "\(movieDetails.voteAverage)"
                numberOfVotesLable.text = "\(movieDetails.voteCount)"
                synopsisLabel.text = movieDetails.overview
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupViews()
        getMovieDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func getMovieDetails() {
        guard let movieId = movieId else { return }
        let urlString = baseURL + "/3/movie/\(movieId)?api_key=\(apiKey)"
        Service.shared.fetchGenericData(urlString: urlString) { (details: MovieDetails) in
            self.movieDetails = details
        }
    }

    private func setupViews() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [posterImage, backButton, titleLable, votingAvgImage, ratingScoreLable, lineView, genreTxtLable, genreLable, numberOfVotesTxtLable, numberOfVotesLable, actorsTxtLable, actorsLable, synopsisTxtLabel,synopsisLabel].forEach{(contentView.addSubview($0))}
        
        scrollView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: nil, size: .init(width: view.frame.width, height: 0))
        
        contentView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor, size: .init(width: view.frame.width, height: 0))

        
        posterImage.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, size: .init(width: 0, height: 250))
        backButton.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 24, left: 16, bottom: 0, right: 0), size: .init(width: 60, height: 44))
        backButton.bringSubviewToFront(posterImage)
        
        votingAvgImage.anchor(top: posterImage.bottomAnchor, leading: nil, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 16), size: .init(width: 30, height: 30))
        ratingScoreLable.anchor(top: votingAvgImage.bottomAnchor, leading: votingAvgImage.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, size: .init(width: 0, height: 30))
        
        titleLable.anchor(top: posterImage.bottomAnchor, leading: posterImage.leadingAnchor, bottom: nil, trailing: votingAvgImage.leadingAnchor, padding: .init(top: 0, left: 8, bottom: 0, right: 8), size: .init(width: 0, height: 60))
        
        lineView.anchor(top: titleLable.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 16, left: 8, bottom: 0, right: 8),size: .init(width: 0, height: 1))
        
        let leftStack = UIStackView(arrangedSubviews: [releaseDateTxtLable, runTimeTxtLable, languageTxtLable])
        leftStack.axis = .vertical
//        leftStack.spacing = 16
        leftStack.distribution = .equalSpacing
        contentView.addSubview(leftStack)
        
        leftStack.anchor(top: lineView.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 16, bottom: 0, right: 0), size: .init(width: 130, height: 100))
//        leftStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        
        let rightStack = UIStackView(arrangedSubviews: [releaseDateLable, runTimeLable, languageLable])
        rightStack.axis = .vertical
//        rightStack.spacing = 16
        rightStack.distribution = .equalSpacing
        contentView.addSubview(rightStack)
        
        rightStack.anchor(top: leftStack.topAnchor, leading: leftStack.trailingAnchor, bottom: leftStack.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
//        rightStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        
        genreTxtLable.anchor(top: leftStack.bottomAnchor, leading: leftStack.leadingAnchor, bottom: nil, trailing: leftStack.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 30))
        genreLable.anchor(top: genreTxtLable.topAnchor, leading: rightStack.leadingAnchor, bottom: nil, trailing: rightStack.trailingAnchor)
        genreLable.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        
        numberOfVotesTxtLable.anchor(top: genreLable.bottomAnchor, leading: genreTxtLable.leadingAnchor, bottom: nil, trailing: genreTxtLable.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 30))
        numberOfVotesLable.anchor(top: numberOfVotesTxtLable.topAnchor, leading: genreLable.leadingAnchor, bottom: nil, trailing: genreLable.trailingAnchor, size: .init(width: 0, height: 30))
        
        actorsTxtLable.anchor(top: numberOfVotesTxtLable.bottomAnchor, leading: numberOfVotesTxtLable.leadingAnchor, bottom: nil, trailing: numberOfVotesTxtLable.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 30))
        
        actorsLable.anchor(top: actorsTxtLable.topAnchor, leading: numberOfVotesLable.leadingAnchor, bottom: nil, trailing: numberOfVotesLable.trailingAnchor)
        actorsLable.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        
        synopsisTxtLabel.anchor(top: actorsLable.bottomAnchor, leading: actorsTxtLable.leadingAnchor, bottom: nil, trailing: actorsLable.trailingAnchor,padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 40))
        
        synopsisLabel.anchor(top: synopsisTxtLabel.bottomAnchor, leading: synopsisTxtLabel.leadingAnchor, bottom: contentView.bottomAnchor, trailing: synopsisTxtLabel.trailingAnchor)
    }
    
    @objc private func closeThisView() {
        navigationController?.popViewController(animated: true)
    }

}
