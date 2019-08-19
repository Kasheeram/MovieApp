//
//  NowPlayingCell.swift
//  MovieApp
//
//  Created by Kashee ram on 8/18/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
    func makeLargeGray() {
        style = .whiteLarge
        color = .gray
    }
}


class NowPlayingMoviesCell: CollectionBaseCell {
    
    let movieListCellId = "movieListCellId"
    let loadMoreFooterCellId = "loadMoreFooterCellId"
    var mainController: MovieListController?
    
    lazy var movieListCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 15.0
        layout.minimumInteritemSpacing = 0.0
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
//        collection.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
        return collection
    }()
    
    let activityView = UIActivityIndicatorView()
    
    var moviesViewModel = [MoviesViewModel]()
    var page = 1
    var totalEntries = 0
    
    
    override func setupViews() {
        super.setupViews()
        activityView.makeLargeGray()
        setupUI()
        getMoviesList()
        
        
    }
    
    func setupUI() {
        addSubview(movieListCollection)
        movieListCollection.register(MovieListCell.self, forCellWithReuseIdentifier: movieListCellId)
        movieListCollection.register(LoadMoreFooterCell.self, forCellWithReuseIdentifier: loadMoreFooterCellId)
        movieListCollection.fillSuperview()
    }
    
    func getMoviesList() {
        let urlString = baseURL + "/3/movie/now_playing?api_key=\(apiKey)&page=\(page)"
        Service.shared.fetchGenericData(urlString: urlString) { (list: Moviews) in
            if let results = list.results, let totalResult =  list.totalResults{
                self.moviesViewModel += results.map({ return MoviesViewModel(results: $0)})
                self.totalEntries = totalResult
            }
            self.movieListCollection.reloadData()
        }
    }
    
    @objc func getMoreData(){
        page = page + 1
        getMoviesList()
        
    }
    
    
}



extension NowPlayingMoviesCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesViewModel.count + 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == moviesViewModel.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: loadMoreFooterCellId, for: indexPath) as! LoadMoreFooterCell
            self.activityView.center = CGPoint(x: cell.contentView.frame.size.width / 2, y: cell.contentView.frame.size.height / 2)
            self.activityView.startAnimating()
            cell.addSubview(self.activityView)
            return cell
        }
        self.activityView.stopAnimating()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieListCellId, for: indexPath) as! MovieListCell
        let movieViewModel = moviesViewModel[indexPath.row]
        cell.movieViewModel = movieViewModel
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == moviesViewModel.count {
            if moviesViewModel.count == self.totalEntries {
                self.activityView.stopAnimating()
                return CGSize(width: collectionView.frame.width, height: 0)
            }
            return CGSize(width: collectionView.frame.width, height: 50)
        }
        return CGSize(width: collectionView.frame.width, height: 330)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if moviesViewModel.count > 0 {
            if (indexPath.row == moviesViewModel.count) {
                if moviesViewModel.count < self.totalEntries {
                    getMoreData()
                } else {
                    self.activityView.stopAnimating()
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moveToViewComplaintScreen(index: indexPath.row)
    }
    
    func moveToViewComplaintScreen(index:Int) {
        let movieDetailController = MovieDetailsController()
        let movie = moviesViewModel[index]
        movieDetailController.movieId = movie.id
        mainController?.navigationController?.pushViewController(movieDetailController, animated: true)
    }
    
    
}
